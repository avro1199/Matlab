% The Matrix form must be in Ax = b
% A = input('Enter the coefficient matrix A : \n');
% B = input('Enter the RHS of the system: ');

A = [11,-5,-6;-5,19,-2;-1,-1,2];
B = [12;0;0];

% Augment A with B
augmented_matrix = [A, B];

% Perform LU decomposition with partial pivoting
[L, U, P] = lu(augmented_matrix);

disp('The lower triangular matrix L is:');
disp(L);
disp('The upper triangular matrix U is:');
disp(U);

% Extract the permuted right-hand side
B_permuted = P * B;

% Solve Ly = B_permuted for y
y = L \ B_permuted;

% Solve Ux = y for x
x = U \ y;

disp('The required Solution X is in LU decomposition:');
disp(x);

% Plot the solution using a bar plot
figure;
% subplot(1, 2, 1);
% bar(x);
% title('Solution X');
% xlabel('Variable Index');
% ylabel('Variable Value');
% grid on;

% Create 3D plot representing the planes defined by the equations
% subplot(1, 2, 2);
[x_mesh, y_mesh] = meshgrid(-10:0.1:10, -10:0.1:10);

% Calculate z values based on the equations
z1 = (B(1) - A(1, 1) * x_mesh - A(1, 2) * y_mesh) / A(1, 3);
z2 = (B(2) - A(2, 1) * x_mesh - A(2, 2) * y_mesh) / A(2, 3);
z3 = (B(3) - A(3, 1) * x_mesh - A(3, 2) * y_mesh) / A(3, 3);


% Plot the planes
surf(x_mesh, y_mesh, z1, 'FaceAlpha', 0.5, 'EdgeColor', 'none', 'FaceColor', 'm');
hold on;
surf(x_mesh, y_mesh, z2, 'FaceAlpha', 0.5, 'EdgeColor', 'none', 'FaceColor', 'g');
surf(x_mesh, y_mesh, z3, 'FaceAlpha', 0.5, 'EdgeColor', 'none', 'FaceColor', 'b');

title('3D Representation of Planes');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
grid on;
hold off;