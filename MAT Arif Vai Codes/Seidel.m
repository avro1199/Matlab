clear;
clc;

A = [8,6,0;2,-8,5;-10,10,15];
B = [2;4;8];

% disp('Enter the system of linear equations in the form of AX=B');
% A = input('Enter matrix A :   \n');
[na, ma] = size(A);
% if na ~= ma
%     disp('ERROR: Matrix A must be a square matrix')
%     return
% end
% B = input('Enter matrix B :   ');    
[nb, mb] = size(B);
% if nb ~= na || mb ~= 1
%     disp('ERROR: Matrix B must be a column matrix')
%     return
% end


D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;

e = max(eig(-inv(D + L) * U));
if abs(e) >= 1
    disp('Since the modulus of the largest Eigen value of the iterative matrix is not less than 1')
    disp('this process is not convergent.')
    return
end

r = input('Any initial guess for X? (y/n):   ', 's');
switch r
    case 'y'
        X0 = input('Enter initial guess for X :\n');
        [nx, mx] = size(X0);
        if nx ~= na || mx ~= 1
            disp('ERROR: Check input')
            return
        end
    otherwise
        X0 = ones(na, 1);
end

t = input('Enter the error allowed in the final answer:  ');
tol = t * ones(na, 1);

iteration_table = zeros(100, na + 1); 

k = 1;
X(:, 1) = X0;
err = 1000000000 * rand(na, 1); 

% Initialize figure for 3D plot of the solution space
figure;

% Create a meshgrid for visualization
[x, y] = meshgrid(-10:0.1:10, -10:0.1:10);

% Plot the planes defined by the equations
for i = 1:na
    z = (-A(i, 1) * x - A(i, 2) * y + A(i, end)) / A(i, 3);
    surf(x, y, z, 'FaceAlpha', 0.5, 'EdgeColor', 'none');
    hold on;
end

while any(abs(err) >= tol) && k <= 100
    X(:, k + 1) = -inv(D + L) * U * X(:, k) + inv(D + L) * B;
    err = X(:, k + 1) - X(:, k); 
    
    iteration_table(k, 1:end-1) = X(:, k + 1)';
    iteration_table(k, end) = norm(err, inf);

    % Plot the current iteration point in the solution space
    plot3(X(1, k:k+1), X(2, k:k+1), X(3, k:k+1), 'o-', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
    hold on;

    % Display the solution after each iteration
    fprintf('Iteration %d - X: %s, Error: %f\n', k, mat2str(X(:, k + 1)), norm(err, inf));

    k = k + 1;
end

xlabel('X1');
ylabel('X2');
zlabel('X3');
title('Solution Space');
grid on;
hold off;

fprintf('The final answer obtained after %g iterations is  \n', k - 1);
x = X(:, k - 1);

disp('Iteration Table:');
disp('----------------------------------------------------------------------------------');
disp('   Iter  |        X1        |        X2        |        X3        |    Error');
disp('----------------------------------------------------------------------------------');
for i = 1:k - 1
    fprintf('   %2d    |   ', i);
    fprintf('%12.4f   |   ', iteration_table(i, 1:end-1));
    fprintf('%12.4f\n', iteration_table(i, end));
end