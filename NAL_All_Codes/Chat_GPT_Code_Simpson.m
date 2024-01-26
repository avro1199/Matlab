% Function to be integrated
f = @(x) 1./(sqrt(1-x.^2));

% Integration limits
a = 0;      % Lower limit
b = 1/sqrt(2);    % Upper limit

% Number of intervals (increase for better accuracy)
n = 1000;

% Step size
h = (b - a) / n;

% Initialize the sum
sum = 0;

% Compute the sum
for i = 1:(n-1)
    x = a + i * h;
    sum = sum + f(x);
end

% Apply the trapezoidal rule formula
integral_value = (h/2) * (f(a) + 2*sum + f(b));

% Display the result
disp('The value of the integral is:');
disp(integral_value);
