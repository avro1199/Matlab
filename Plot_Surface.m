% Define the range for x and y
x = linspace(-10, 10, 100);
y = linspace(-10, 10, 100);

% Create a grid of x and y values
[X, Y] = meshgrid(x, y);

% Calculate z values based on the equation 4x - 2y + 3z = 8
Z1 = (2 - 8*X - 6*Y) * 0;
Z2 = (4 - 2*X + 8*Y) / 5;
Z3 = (8 + 10*X - 10*Y) / 15;

% Plot the surface
figure;
hold on;
surf(X, Y, Z1,faceAlpha=.5, FaceColor="flat");
surf(X, Y, Z2,"FaceColor","flat","FaceAlpha",.5);
surf(X, Y, Z3,"FaceColor","flat","FaceAlpha",.5);

shading interp;

plot3(.25, 0, .7, 'ro', 'LineWidth',2, MarkerSize=2);

% Set labels and title
xlabel('X');
ylabel('Y');
zlabel('Z');
% title('Surface Plot: 4x - 2y + 3z = 8');

% Add a colorbar for reference
colorbar;

% Adjust the view for better visualization
view(45, 30);