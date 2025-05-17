close all;
clear all;
clc;

% M2_6(ii)
% Define the transfer function G(s) = (s + 1) / (s^2 + 3s + 1)
numerator = [1, 1];         
denominator = [1, 3, 1];    
G = tf(numerator, denominator);
G_ramp = G * tf(1, [1, 0]);    % Multiply G(s) by 1/s for ramp response
G_parabolic = G * tf(1, [1, 0, 0]); % Multiply G(s) by 1/s^2 for parabolic response
t = 0:0.01:10; % Simulation time from 0 to 10 seconds
% Step response for ramp input
y_ramp = step(G_ramp, t);
% Step response for parabolic input
y_parabolic = step(G_parabolic, t);
figure;
% Plot response to ramp input
subplot(2, 1, 1);
plot(t, t, 'r--', 'LineWidth', 1.5); hold on; % Ideal ramp input
plot(t, y_ramp, 'b', 'LineWidth', 1.5);
title('Response of G(s) to Ramp Input');
xlabel('Time (s)');
ylabel('Output');
legend('Ramp Input', 'System Response');
grid on;
% Plot response to parabolic input
subplot(2, 1, 2);
plot(t, t.^2, 'r--', 'LineWidth', 1.5); hold on; % Ideal parabolic input
plot(t, y_parabolic, 'b', 'LineWidth', 1.5);
title('Response of G(s) to Parabolic Input');
xlabel('Time (s)');
ylabel('Output');
legend('Parabolic Input', 'System Response');
grid on;
