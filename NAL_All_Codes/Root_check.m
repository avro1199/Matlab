syms B;

Vrms = 100;
Vm = Vrms*sqrt(2);
R = 26;
L = 38e-3;
W = 377;
Z = sqrt(R^2 + (W*L)^2);
T = L/R;
theta = atan((W*L)/R);

f(B) = (Vm/Z)*(sin(B-theta) + sin(theta)*exp(-B/(W*T)));

interval = .59;
for n = -pi:.1:pi
    %fprintf('%d => %f\n', n, f(n));
    if(f(n)*f(n + interval) < 0)
        fprintf('a = %d; b = %d; f(%d) => %f; f(%d) => %f\n',n, n+interval, n, f(n), n+interval, f(n+interval))
    end
end