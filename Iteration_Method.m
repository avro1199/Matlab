clc;
syms B;

Vrms = 100;
Vm = Vrms*sqrt(2);
R = 14;
L = 82e-3;
W = 377;
Z = sqrt(R^2 + (W*L)^2);
T = L/R;
theta = atan((W*L)/R);

max_it = 100;
tol = 0.0001;

root(1) = 3.8;

i(B) = (Vm/Z)*(sin(B-theta) + sin(theta)*exp(-B/(W*T)));

fn(B) = asin(-sin(theta)*exp(-(B/(W*T))))+theta;
fnn(B) = diff(fn,B);

for n = 1:max_it
    root(n+1) = fn(root(n));
    fprintf('%f\n',root(n));
    if(abs(root(n+1) - root(n)) < tol)
        fprintf('Final Root => %f\n',root(n+1));
        break;
    end
end

% fplot(i);
% xlim([-5 40]);
% ylim([-20 80]);

% for j = 1:n+1
%     fprintf('%.9f\n', fn(root(j)));
% end

