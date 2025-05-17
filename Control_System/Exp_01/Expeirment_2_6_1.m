close all;
clear all;
clc; 

%% M2.6 (i)
%%%     G(s) = (s + 1) / (s^2 + 3s + 1)
numerator = [1, 1];         
denominator = [1, 3, 1];   
G = tf(numerator, denominator);
t = 0:0.01:10;  %% Simulation time from 0 to 10 seconds
ramp_input = t;  %   i/p u(t) = (t)
parabolic_input = t.^2;   % Parabolic i/p u(t) = (t^2)
y_ramp = lsim(G, ramp_input, t);  %% response to ramp input
y_parabolic = lsim(G, parabolic_input, t); %  response to parabolic input
% Plot results
figure;
% Plot response to ramp input
subplot(2, 1, 1);
plot(t, ramp_input, 'r--', 'LineWidth', 1.5); hold on;
plot(t, y_ramp, 'b', 'LineWidth', 1.5);
title('Response of G(s) to Ramp Input');
xlabel('Time (s)');
ylabel('Output');
legend('Ramp Input', 'System Response');
grid on;
% Plot response to parabolic input
subplot(2, 1, 2);
plot(t, parabolic_input, 'r--', 'LineWidth', 1.5); hold on;
plot(t, y_parabolic, 'b', 'LineWidth', 1.5);
title('Response of G(s) to Parabolic Input');
xlabel('Time (s)');
ylabel('Output');
legend('Parabolic Input', 'System Response');
grid on;
