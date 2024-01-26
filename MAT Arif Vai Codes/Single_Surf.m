% Define the equation
syms x y
eq = 8*x + 6*y == 2;

% Solve for y in terms of x
y_sol = solve(eq, y);

% Create a range of x values
x_values = linspace(-10, 10, 100);

% Evaluate y for each x using the obtained solution
y_values = subs(y_sol, x, x_values);

% Create a 3D plot
figure;
plot3(x_values, y_values, 8*x_values + 6*y_values, 'LineWidth', 2);
grid on;
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Surface Plot: 8x + 6y = 2');
