close all;
    %G(s) = (s + 1) / (s^2 + 3s + 1)
numerator = [1, 1];        
denominator = [1, 3, 1];    
G = tf(numerator, denominator);
%time vector for 30 seconds
t = 0:0.01:30;
    %square signal with a period of 4 seconds
[square_signal, t_square] = gensig('square', 4, 30); % Signal type, period, duration, step size
    %pulse signal with a period of 4 seconds
[pulse_signal, t_pulse] = gensig('pulse', 4, 30);
    %time response of square signal
response_square = lsim(G, square_signal, t_square);
    % response of pulse signal
response_pulse = lsim(G, pulse_signal, t_pulse);
figure;
% Response to square signal
subplot(2, 1, 1);
plot(t_square, square_signal, 'r--', 'LineWidth', 1.5); hold on;
plot(t_square, response_square, 'b', 'LineWidth', 1.5);
title('Response of G(s) to Square Signal');
xlabel('Time (s)');
ylabel('Output');
legend('Square Signal', 'System Response');
grid on;
% Response to pulse signal
subplot(2, 1, 2);
plot(t_pulse, pulse_signal, 'r--', 'LineWidth', 1.5); hold on;
plot(t_pulse, response_pulse, 'b', 'LineWidth', 1.5);
title('Response of G(s) to Pulse Signal');
xlabel('Time (s)');
ylabel('Output');
legend('Pulse Signal', 'System Response');
grid on;
