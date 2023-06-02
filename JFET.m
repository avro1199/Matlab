clear;
clc;


Vds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
Id_Vgs0 = [0.8, 1.2, 2.2, 3.5, 4.5, 5.5, 6.5, 7.5, 8.5, 9.5];
Id_Vgsn5 = [1, 1.2, 2, 3, 4, 5, 6, 7, 8, 9];
Id_Vgsn10 = [.5, 1.2, 1.8, 2.5, 3.7, 4.3, 5.8, 6.5, 7.6, 8.6];
Id_Vgsn15 = [0.5, 1, 1.6, 2.3, 3.2, 4, 5.2, 6, 7, 8];
Id_Vgsn20 = [.4, .8, 1.5, 2, 3, 3.8, 4.9, 5.6, 6.5, 7.5];

% subplot(2,1,1);
plot(Vds,Id_Vgs0,LineWidth=1.5);
legend('V_g_s=0.0V');
title('Characteristics Curve')
xlim([0, 12]);
ylim([0, 12]);
grid on;
hold on;
xlabel('V_d_s','FontAngle','italic', FontWeight='bold', FontSize=13, Rotation=0);
ylabel('I_d','FontAngle','italic', FontWeight='bold', FontSize=13, Rotation=0);
plot(Vds, Id_Vgsn5, LineWidth=1.5, DisplayName='V_g_s=-0.5V');
plot(Vds, Id_Vgsn10, LineWidth=1.5, DisplayName='V_g_s=-1.0V');
plot(Vds, Id_Vgsn15, LineWidth=1.5, DisplayName='V_g_s=-1.5V');
plot(Vds, Id_Vgsn20, LineWidth=1.5, DisplayName='V_g_s=-2.0V');
% 
% in = input('Second Plot');


% Vgs_Vds10 = [0, -.5, -1, -1.5, -2, -2.5, -3, -3.5];
% Id_Vds10 = [18, 12.1, 6.8, 2.2, .02, 0, 0, 0];
% 
% % subplot(2,1,2);
% plot(Vgs_Vds10, Id_Vds10, LineWidth=1.5);
% title('Transfer Curve')
% xlim([-4, 1]);
% grid on;
% xlabel('V_g_s','FontAngle','italic', FontWeight='bold', FontSize=13, Rotation=0);
% ylabel('I_d','FontAngle','italic', FontWeight='bold', FontSize=13, Rotation=0)