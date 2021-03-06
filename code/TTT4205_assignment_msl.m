close all; clear all;

c = 3e8;
mu_r = 1;
epsilon_0 = 8.854187817e-12;
student_nr = 6;

epsilon_r_t7_t8 = 2+0.22*student_nr; %3.32
epsilon_r_t9 = 3+0.22*student_nr; %4.32


w1_t7_t8_t9 = 0.1e-3:(4e-3-0.1e-3)/99:4e-3; % Width of microstrip line

eff_rel_perm_t7 = zeros(100,2); % Init vector

% Calculate table for effective permittivity
for i = 1:100
    eff_rel_perm_t7(i,1) = w1_t7_t8_t9(i);
    eff_rel_perm_t7(i,2) = eff_rel_perm(1e-3,w1_t7_t8_t9(i),epsilon_r_t7_t8);
end

figure('Units','centimeters','Position',[0 0 17 10],'PaperPositionMode','auto');
plot(eff_rel_perm_t7(:,1),real(eff_rel_perm_t7(:,2)));
grid on;
ax = gca;
ax.Units = 'normalized';
ax.FontUnits = 'points';
ax.FontWeight = 'normal';
ax.FontSize = 13;
ax.FontName = 'Times';
%ax.YTick = 0:0.25:1.5;
%ax.XTick = 7.5e9:25e8:16e9;
ylabel({'Effective relative permittivity $[\epsilon_{\rm eff}]$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
xlabel({'Width of microstrip conductor $[W]$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
print -depsc2 eff_rel_perm_t7.eps;

char_imp_t8 = zeros(100,2); % Init vector

% Calculate table for characteristic impedance
for i = 1:100
    char_imp_t8(i,1) = w1_t7_t8_t9(i);
    char_imp_t8(i,2) = char_imped(1e-3,w1_t7_t8_t9(i),epsilon_r_t7_t8);
end

figure('Units','centimeters','Position',[0 0 17 10],'PaperPositionMode','auto');
plot(char_imp_t8(:,1),real(char_imp_t8(:,2)));
grid on;
ax = gca;
ax.Units = 'normalized';
ax.FontUnits = 'points';
ax.FontWeight = 'normal';
ax.FontSize = 13;
ax.FontName = 'Times';
%ax.YTick = 0:0.25:1.5;
%ax.XTick = 7.5e9:25e8:16e9;
ylabel({'Impedance $[\Omega]$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
xlabel({'Width of microstrip conductor $[W]$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
print -depsc2 char_imped_t8.eps;

reflect_coeff_t9 = zeros(100,2); % Init vector
trans_coeff_t9 = zeros(100,2); % Init vector
w2_t9 = 1e-3; % Width of second microstrip

% Calculate tables for S-matrix coefficients
for i = 1:100
    reflect_coeff_t9(i,1) = w1_t7_t8_t9(i);
    trans_coeff_t9(i,1) = w1_t7_t8_t9(i);
    reflect_coeff_t9(i,2) = reflect_coeff(char_imped(0.5e-3,w1_t7_t8_t9(i),epsilon_r_t9),char_imped(0.5e-3,w2_t9,epsilon_r_t9));
    trans_coeff_t9(i,2) = trans_coeff(char_imped(0.5e-3,w1_t7_t8_t9(i),epsilon_r_t9),char_imped(0.5e-3,w2_t9,epsilon_r_t9));
end

figure('Units','centimeters','Position',[0 0 17 10],'PaperPositionMode','auto');
plot(trans_coeff_t9(:,1),real(trans_coeff_t9(:,2)));
hold on;
plot(reflect_coeff_t9(:,1),real(reflect_coeff_t9(:,2)));
grid on;
ax = gca;
ax.Units = 'normalized';
ax.FontUnits = 'points';
ax.FontWeight = 'normal';
ax.FontSize = 13;
ax.FontName = 'Times';
%ax.YTick = 0:5e8:2.5e9;
%ax.XTick = 7.5e9:25e8:16e9;
ylabel({'Magnitude'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
xlabel({'Width of microstrip conductor $[W]$'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times');
legend({'Transmission coefficient','Reflection coefficient'},'FontUnits','points','interpreter','latex','FontSize',13,'FontName','Times','Location','southeast');
print -depsc2 s-matrix_t9.eps;






