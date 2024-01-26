% Run the code from script after loading data6
n   = input('Number of equations, n:  ');
A1  = input('Enter the input matrix: ');
A   = zeros(n, n+1);
x1  = zeros(n, 1);
x2  = zeros(n, 1);
tol = input('Tolerance: ');
m   = input('Maximum number of iterations, m:  ');

A   = A1;

k = 1;
iteration_table = zeros(m, n + 1);

while k <= m
    err = 0;
    for i = 1 : n
        s = 0;
        for j = 1 : n
            s = s - A(i, j) * x1(j);
        end
        s = (s + A(i, n+1)) / A(i, i);
        if abs(s) > err
            err = abs(s);
        end
        x2(i) = x1(i) + s;
    end

    % Update iteration table
    iteration_table(k, 1:n) = x2';
    iteration_table(k, end) = err;

    fprintf('Iteration %d - x: %s, Error: %f\n', k, mat2str(x2), err);

    if err <= tol
        break;
    end

    k = k + 1;
    x1 = x2;
end

fprintf('Solution after %d iterations is :\n', k - 1);
for i = 1 : n
    fprintf('x%d : %f \n', i, x2(i));
end

% Display Iteration Table
disp('Iteration Table:');
disp(' Iter |   x1   |   x2   |   x3   |  ...  |   Error');
disp('-----------------------------------------------');
for i = 1 : k - 1
    fprintf('  %2d  |', i);
    fprintf(' %6.4f |', iteration_table(i, 1:n));
    fprintf(' %6.4f\n', iteration_table(i, end));
end

% Plot the final solution in the solution space
figure;

% Create a meshgrid for visualization
[x, y] = meshgrid(-10:0.1:10, -10:0.1:10);

% Plot the planes defined by the equations
for i = 1:n
    z = (-A(i, 1) * x - A(i, 2) * y + A(i, end)) / A(i, 3);
    surf(x, y, z, 'FaceAlpha', 0.5, 'EdgeColor', 'none');
    hold on;
end

% Plot the final solution in the solution space
plot3(x2(1), x2(2), x2(3), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
xlabel('X1');
ylabel('X2');
zlabel('X3');
title('Solution Space');
grid on;
