clear;
clc;

syms f(x);

X = [1, 2, 3, 4, 5];
Y = [.6, 2.4, 3.5, 4.8, 5.7];

m = length(X);

plot(X, Y, '*', Color='#ff0000', LineWidth=1.5);
grid on;
hold on;
xlim([-2, 9]);

sum_xy = 0;
sum_x = 0;
sum_y = 0;
sum_x_sq = 0;

for i = 1:m
    sum_x = sum_x + X(i);
    sum_y = sum_y + Y(i);
    sum_xy = sum_xy + (X(i) * Y(i));
    sum_x_sq = sum_x_sq + (X(i))^2;
end


a_1 = ((m * sum_xy) - (sum_x * sum_y))/((m*sum_x_sq) - (sum_x)^2);

a_0 = (sum_y/m) - a_1 * (sum_x/m);

f(x) = a_0 + a_1*x;

fplot(f(x), Color='#0000ff', LineWidth=1);