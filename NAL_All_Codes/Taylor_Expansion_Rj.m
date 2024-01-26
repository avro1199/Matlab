clear;
clc;

A = (38+26)/2;

syms f(x) t(x);

f(x) = cos(A*x);

a = pi/4;

no_of_term = 30;
N_per_plot = 6;

t(x) = f(a);
deri = diff(f, x);

subplot(((no_of_term/N_per_plot)+1),1,1);
fplot(f(x), LineWidth=1);
hold on;
grid on;
xlim ([(0.5) (1.05)])
ylim ([-5 5]);
fplot(t(x),LineWidth=1);
title('Rj', '1');

for i = 1:no_of_term
    t(x) = t(x) + deri(a)*((x-a)^i)/factorial(i);
    deri = diff(deri,x);
    if(rem(i,N_per_plot)==0)
        subplot(((no_of_term/N_per_plot)+1),1,(i/N_per_plot)+1);
        fplot(f(x), LineWidth=1);
        hold on;
        grid on;
        xlim ([(0.5) (1.05)])
        ylim ([-2 2]);
        fplot(t(x),LineWidth=1);
        title('No. of Terms in the Series',num2str(i));
    end
end

% checking for random input near expansion point(pi/4)
% value = pi/4.2; %distance increases from the expansion point => more term needed in the series
value = input("Enter the Point : ")
fprintf('From Taylor Series => %.9f\n', t(value));
fprintf('From Original Function => %.9f\n', f(value));