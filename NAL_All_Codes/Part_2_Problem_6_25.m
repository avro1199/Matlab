clear;
clc;

fnc = @(x) (1./(1+x));

a = 0;
b = 1;
n = 12;

h = (b-a)/n;

integral(fnc, 0, 1)

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

Vol_Sim = (h/3)*(Y(1) + Y(n) + sum_even*4 + sum_odd*2); % Simpson Method
Vol_Trp = (h/2)*(Y(1) + Y(n) + 2*sum); %Trapezoid Method

%Oriignal Result
fprintf('Original Result => %.9f\n\n', integral(fnc, a, b));

fprintf('Simpson Result => %.9f\n',Vol_Sim);
fprintf('Trapezoidal Result => %.9f\n',Vol_Trp);