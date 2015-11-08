close all; clear all;

c = 3e8;
mu_r = 1;
epsilon_0 = 8.854187817e-12;
student_nr = 6;

epsilon_r_t7_t8 = 2+0.22*student_nr; %3.32
epsilon_r_t9 = 3+0.22*student_nr; %4.32


w_t7_t8 = 0.1:(4-0.1)/99:4;
eff_rel_perm_t7 = zeros(100,2); % Init vector

% Calculate table for equivalent capacitance
for i = 1:100
    eff_rel_perm_t7(i,1) = w_t7_t8(i);
    eff_rel_perm_t7(i,2) = eff_rel_perm(1e-3,w_t7_t8(i),epsilon_r_t7_t8);
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