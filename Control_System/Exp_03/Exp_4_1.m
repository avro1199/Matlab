clear all;
clc;

s = tf('s');

ka = 80;
g1 = 5000/(s+1000);
g2 = 1/(s*(s+20));

tfmdl = feedback(series(ka*g1, g2), 1);
Mw = (-1)*feedback(g2, ka*g1);


xlabel('Time(sec)');
ylabel('Amplitude');

figure(1);
step(tfmdl);
grid on;
% hold on;
figure(2)
step(Mw);
grid on;