clc;
clear;

syms B;

Vrms = 100;
Vm = Vrms*sqrt(2);
R = 26;
L = 38e-3;
W = 377;
Z = sqrt(R^2 + (W*L)^2);
T = L/R;
theta = atan((W*L)/R);

max_it = 30;
tol = 0.00001;

i(B) = (Vm/Z)*(sin(B-theta) + sin(theta)*exp(-B/(W*T)));

y(B) = diff(i,B);

root(1) = 3;

for n = 1:max_it
    root(n+1) = root(n) - (i(root(n))/y(root(n)));

    fprintf('%f\n',(i(root(n))/y(root(n))));

    if(abs( root(n+1) - root(n) ) < tol)
        fprintf('%f\n', (i(root(n))/y(root(n))));
        break;
        
    end
end


%fprintf('\n\t%.9f', i(root(n+1)));

% fplot(i,color='#ff00ff',LineWidth=1.5);
% legend('i_0');
% title ('(Vm/Z)*(Sin(β-θ)+Sin(θ)*e^-^V^/^ω^*^τ)',Color='#aa0000');
% grid on;
% xlim([-5 40]);
% ylim([-20 80]);

