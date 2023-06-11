clear;
clc;

fnc = @(x) 2./(sqrt(1-x.^2));

a = 0;
b = 1/sqrt(2);
n = 10;

h = (b-a)/n;

X = [a:h:b];
Y = fnc(X);
n = length(X);

sum = 0;
sum_odd = 0;
sum_even = 0;
for i = 2:n-1
    sum = sum + Y(i);
    if(rem(i,2) == 0)
        sum_even = sum_even + Y(i);
    else
        sum_odd = sum_odd + Y(i);
    end
end

Vol_Sim = (h/3)*(Y(1) + Y(n) + sum_even*4 + sum_odd*2); % Simpson
Vol_Trp = (h/2)*(Y(1) + Y(n) + 2*sum); %Trapezoid

%Oriignal Result
fprintf('Original Result => %.9f\n\n', integral(fnc, a, b));

fprintf('Simpson Result => %.9f\n',Vol_Sim);
fprintf('Trapezoidal Result => %.9f\n',Vol_Trp);

% plot(X,Y)
% xlim([-.1 1.1])