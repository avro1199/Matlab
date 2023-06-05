clc;
clear;

x = [0, .25, .5, .75, 1];
y = [1, .9896, .9589, .9089, .8415];
y_sq = y.^2;

h = x(2) - x(1);
n = length(x);

sum = 0;
sum_odd = 0;
sum_even = 0;
for i = 2:n-1
    sum = sum + y_sq(i);
    if(rem(i,2) == 0)
        sum_even = sum_even + y_sq(i);
    else
        sum_odd = sum_odd+ y_sq(i);
    end
end

Vol_Sim = pi*(h/3)*(y_sq(1) + y_sq(n) + sum_even*4 + sum_odd*2); % Simpson
Vol_Trp = pi*(h/2)*(y_sq(1) + y_sq(n) + 2*sum); %Trapezoid

fprintf('Trap Vol = %.9f\n',Vol_Trp)
fprintf('Simp Vol = %.9f',Vol_Sim)