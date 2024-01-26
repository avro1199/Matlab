clear;
clc;

A = (38+26)/2; %change xlim & ylim for different value of A

syms x f(x) t(x);

f(x) = cos(A*x);

a = pi/4;
no_of_term = 10;
t(x) = f(a);
deri = diff(f, x);

fplot(f(x), LineWidth=1, Color='#ff0000');
legend ('Main Fnc.');
hold on;
grid on;
xlim ([(0.5) (1.05)])
ylim ([-10 10]);
fplot(t(x),LineWidth=1);
hold on;

for i = 1:no_of_term
    t(x) = t(x) + deri(a)*((x-a)^i)/factorial(i);
    deri = diff(deri,x);
    fplot(t(x), LineWidth=1);
end

% checking for random input near expansion point(pi/4)
value = pi/4.3; %distance increases from the expansion point => more term needed in the series
fprintf('From Taylor Series => %.9f\n', t(value));
fprintf('From Original Function => %.9f\n', f(value));