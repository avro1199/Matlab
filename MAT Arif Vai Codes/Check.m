% Define the coefficients matrix A and the right-hand side vector B
A = [8, 6, 0; 2, -8, 5; -10, 10, 15];
B = [2; 4; 8];

% Solve the system of equations Ax = B to find x, y, z
XYZ = A \ B;
x = XYZ(1);
y = XYZ(2);
z = XYZ(3);

% Create a grid of points for plotting the surface
[X, Y] = meshgrid(linspace(-1, 1, 100), linspace(-1, 1, 100));

% Calculate the corresponding Z values using the equation
Z = (B(1) - A(1,1)*X - A(1,2)*Y) / A(1,3);

% Plot the surface
figure;
surf(X, Y, Z, 'FaceAlpha', 0.5, 'EdgeAlpha', 0.8);
hold on;

% Plot the solution point
plot3(x, y, z, 'ro', 'MarkerSize', 3, 'LineWidth', 3);

% Set axis labels and title
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Surface defined by [8,6,0;2,-8,5;-10,10,15][x;y;z] = [2;4;8]');

% Display the solution point
text(x, y, z, sprintf('(%.2f, %.2f, %.2f)', x, y, z), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left');

% Show grid and adjust the view
grid on;
view(3);
hold off;
