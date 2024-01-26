clear;
clc;

% Input matrix A and matrix B manually
% A = input('Input matrix A: ');
% B = input('Input matrix B: ');

A = [8,6,0;2,-8,5;-10,10,15];
B = [2;4;8];

% Augmented matrix [A | B]
augmented_matrix = [A, B];

% Perform Gaussian elimination
[m, n] = size(augmented_matrix);
for pivot_row = 1:m-1
    for current_row = pivot_row+1:m
        factor = augmented_matrix(current_row, pivot_row) / augmented_matrix(pivot_row, pivot_row);
        augmented_matrix(current_row, :) = augmented_matrix(current_row, :) - factor * augmented_matrix(pivot_row, :);
    end
end

augmented_matrix

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

% Create a 3D graph to visualize the planes
[x, y] = meshgrid(-10:0.1:10, -10:0.1:10);

figure;
for i = 1:m
    z = (-augmented_matrix(i, 1) * x - augmented_matrix(i, 2) * y + augmented_matrix(i, end)) / augmented_matrix(i, 3);
    surf(x, y, z, 'FaceAlpha', 0.5, 'EdgeColor', 'none');
    hold on;
end

xlabel('X1');
ylabel('X2');
zlabel('X3');
title('3D Graph of Planes');
grid on;