clear;
clc;

% Define the coefficients matrix A and the constant vector b
A = [8, 6, 0; 2, -8, 5; -10, 10, 15];
b = [2; 4; 8];

[sol] = A \ b;

% Define a grid of points for x, y, and z
[x, y] = meshgrid(linspace(-10, 10, 100), linspace(-10, 10, 100));

% Solve for z using the equation Ax = b
z1 = (b(1) - A(1,1)*x - A(1,2)*y) / A(1,3);
z2 = (b(2) - A(2,1)*x - A(2,2)*y) / A(2,3);
z3 = (b(3) - A(3,1)*x - A(3,2)*y) / A(3,3);

% Plot the surface
figure;
hold on;
surf(x, y, z1);
surf(x, y, z2);
surf(x, y, z3);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Surface defined by Ax = b');
% shading interp;
% Add the vector b as a point on the surface
plot3(sol(1), sol(2), sol(3), 'ro', 'LineWidth',2, MarkerSize=2);

% Show grid and adjust view for better visibility
grid on;
view(-45, 30);
