close all; clear all;

c = 3e8;
mu_r = 1;
epsilon_0 = 8.854187817e-12;
mu_0 = pi * 4e-7;

epsilon_r = 1; % For hollow waveguide
epsilon_r_student_nr = (1 + (0.24 * 6)); % Waveguide filled with perfect dielectric
a = 19.05e-3; % For WR75 waveguide
b = 9.525e-3; % For WR75 waveguide

f_c_10 = f_c_mn(1,0,a,b,epsilon_r,mu_r)
f_c_20 = f_c_mn(2,0,a,b,epsilon_r,mu_r)
delta_F = (f_c_20 - f_c_10)

f = 5e9:(25e9 - 5e9)/99:25e9; % 5Ghz to 25GHz, 200MHz steps = 100 steps
k_z_10 = zeros(100,2); % Init vector
k_z_20 = zeros(100,2); % Init vector

% Calculate table for TE10
for i = 1:100
    k_z_10(i,1) = f(i);
    k_z_10(i,2) = k_z_mn(f(i),1,0,a,b,epsilon_r,mu_r)/k_0(f(i));
end

% Calculate table for TE20
for i = 1:100
    k_z_20(i,1) = f(i);
    k_z_20(i,2) = k_z_mn(f(i),2,0,a,b,epsilon_r,mu_r)/k_0(f(i));
end

figure('Units','centimeters','Position',[0 0 17 10],'PaperPositionMode','auto');
plot(k_z_10(:,1),real(k_z_10(:,2)));
hold on;
plot(k_z_20(:,1),real(k_z_20(:,2)));
grid on;
%'YTick',0:f(end)/100:f(end),'XTick',0:k_z_10(end)/10:k_z_10(end)
ax = gca;
ax.Units = 'normalized';
ax.FontUnits = 'points';
ax.FontWeight = 'normal';
ax.FontSize = 13;
ax.FontName = 'Times';
ax.YTick = 0:0.25:1;
ax.XTick = 5e9:50e8:25e9;
ylabel({'$k_{\rm z}^{\rm (mn)}/k_{\rm 0}$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
xlabel({'$f [{\textrm Hz}]$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
legend({'${\rm TE_{\rm 10}}$','${\rm TE_{\rm 20}}$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times','Location','northwest');
print -depsc2 prop_const.eps;

F = f_c_10:(f_c_20 - f_c_10)/99:f_c_20;
V_ph_10 = zeros(100,2); % Init vector
V_g_10 = zeros(100,2); % Init vector
W_mn_10 = zeros(100,2); % Init vector

% Calculate table for phase velocity
for i = 1:100
    V_ph_10(i,1) = F(i);
    V_ph_10(i,2) = V_ph_mn(F(i),1,0,a,b,epsilon_r,mu_r);
end

% Calculate table for group velocity
for i = 1:100
    V_g_10(i,1) = F(i);
    V_g_10(i,2) = V_g_mn(F(i),1,0,a,b,epsilon_r,mu_r);
end

% Calculate table for wave impedance
for i = 1:100
    W_mn_10(i,1) = F(i);
    W_mn_10(i,2) = W_mn_TE(F(i),1,0,a,b,epsilon_r,mu_r);
end

figure('Units','centimeters','Position',[0 0 17 10],'PaperPositionMode','auto');
plot(V_ph_10(:,1),real(V_ph_10(:,2)));
hold on;
plot(V_g_10(:,1),real(V_g_10(:,2)));
grid on;
ax = gca;
ax.Units = 'normalized';
ax.FontUnits = 'points';
ax.FontWeight = 'normal';
ax.FontSize = 13;
ax.FontName = 'Times';
ax.YTick = 0:5e8:2.5e9;
ax.XTick = 7.5e9:25e8:16e9;
ylabel({'Velocity ${\rm [m/s]}$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
xlabel({'$f [{\textrm Hz}]$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
legend({'${\rm V_{\rm ph}}$','${\rm V_{\rm g}}$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times','Location','northeast');
print -depsc2 velocity.eps;

figure('Units','centimeters','Position',[0 0 17 10],'PaperPositionMode','auto');
plot(W_mn_10(:,1),real(W_mn_10(:,2)));
grid on;
ax = gca;
ax.Units = 'normalized';
ax.FontUnits = 'points';
ax.FontWeight = 'normal';
ax.FontSize = 13;
ax.FontName = 'Times';
ax.YTick = 0:500:3000;
ax.XTick = 7.5e9:25e8:16e9;
ylabel({'Wave impedance $[\Omega]$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
xlabel({'$f [{\textrm Hz}]$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
print -depsc2 wave_imp.eps;

f_c_10_student_nr = f_c_mn(1,0,a,b,epsilon_r_student_nr,mu_r)
f_c_20_student_nr = f_c_mn(2,0,a,b,epsilon_r_student_nr,mu_r)
F_student_nr = f_c_10_student_nr:(f_c_20_student_nr - f_c_10_student_nr)/99:f_c_20_student_nr;

loss_constant_10 = zeros(100,2); % Init vector

% Calculate table for loss constant (normalized frequency)
for i = 1:100
    loss_constant_10(i,1) = F_student_nr(i)/f_c_mn(1,0,a,b,epsilon_r_student_nr,mu_r);
    loss_constant_10(i,2) = loss_constant(F_student_nr(i),1,0,a,b,epsilon_r_student_nr,mu_r);
end

figure('Units','centimeters','Position',[0 0 17 10],'PaperPositionMode','auto');
plot(loss_constant_10(:,1),real(loss_constant_10(:,2)));
grid on;
ax = gca;
ax.Units = 'normalized';
ax.FontUnits = 'points';
ax.FontWeight = 'normal';
ax.FontSize = 13;
ax.FontName = 'Times';
%ax.YTick = 0:0.25:1.5;
%ax.XTick = 0.5:0.25:2;
ylabel({'Dielectric loss constant'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
xlabel({'$f/f_{\rm c}$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
print -depsc2 dielec_loss_const.eps;

s = 0.32*b;

equiv_capacitance_10 = zeros(100,2); % Init vector

% Calculate table for equivalent capacitance
for i = 1:100
    equiv_capacitance_10(i,1) = F(i);
    equiv_capacitance_10(i,2) = equiv_capacitance(F(i),s,1,0,a,b,epsilon_r,mu_r);
end

figure('Units','centimeters','Position',[0 0 17 10],'PaperPositionMode','auto');
plot(equiv_capacitance_10(:,1),real(equiv_capacitance_10(:,2)));
grid on;
ax = gca;
ax.Units = 'normalized';
ax.FontUnits = 'points';
ax.FontWeight = 'normal';
ax.FontSize = 13;
ax.FontName = 'Times';
%ax.YTick = 0:0.25:1.5;
ax.XTick = 7.5e9:25e8:16e9;
ylabel({'Equivalent capacitance ${\rm [F]}$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
xlabel({'$f {\rm [Hz]}$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
print -depsc2 equiv_capacitance.eps;

equiv_inductance_10 = equiv_inductance(s,1,0,a,b,mu_r,mu_0)




