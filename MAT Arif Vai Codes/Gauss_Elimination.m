clear;
clc;

a = linspace(-10,.1,10);
b = (2-8.*a)/6;
c = a.*0;

% Input matrix A and matrix B manually
% A = input('Input matrix A: ');
% B = input('Input matrix B: ');

A = [8,6,0;2,-8,5;-10,10,15];
B = [2;4;8];

sol = A\B; %Original Solution


% Create a 3D graph to visualize the planes
[x, y] = meshgrid(-10:0.1:10, -10:0.1:10);

% Augmented matrix [A | B]
augmented_matrix = [A, B];

% Perform Gaussian elimination
[m, n] = size(augmented_matrix);
for pivot_row = 1:m-1
    augmented_matrix(pivot_row, :) = augmented_matrix(pivot_row, :) / augmented_matrix(pivot_row, pivot_row); % this line added by Rj Avro for Echelon form
    if pivot_row < m
        for current_row = pivot_row+1:m
        factor = augmented_matrix(current_row, pivot_row) / augmented_matrix(pivot_row, pivot_row);
        augmented_matrix(current_row, :) = augmented_matrix(current_row, :) - factor * augmented_matrix(pivot_row, :);
        end
    end
    % Plotting each stage by Rj Avro %
    z1 = ((augmented_matrix(1, end) - augmented_matrix(1,1)*x - augmented_matrix(1,2)*y)) / augmented_matrix(1,3);
    z2 = ((augmented_matrix(2, end) - augmented_matrix(2,1)*x - augmented_matrix(2,2)*y)) / augmented_matrix(2,3);
    z3 = ((augmented_matrix(3, end) - augmented_matrix(3,1)*x - augmented_matrix(3,2)*y)) / augmented_matrix(3,3);

    figure;
    hold on;
    surf(x, y, z1);
    surf(x, y, z2);
    surf(x, y, z3);
    plot3(a,b,c)
    xlabel('X-axis');
    ylabel('Y-axis');
    zlabel('Z-axis');
    title('Surface defined by Ax = b');
    % shading interp;
    % Add the vector b as a point on the surface
    plot3(sol(1), sol(2), sol(3), 'ro', 'LineWidth',2, MarkerSize=2);
    grid on;
    axis tight
    view(-45, 30);
end


% augmented_matrix

% Back substitution
solution = zeros(m, 1);
for i = m:-1:1
    solution(i) = augmented_matrix(i, end) / augmented_matrix(i, i);
    for j = i-1:-1:1
        augmented_matrix(j, end) = augmented_matrix(j, end) - augmented_matrix(j, i) * solution(i);
    end
end

% Display the solution
disp('Solution:');
disp(solution);