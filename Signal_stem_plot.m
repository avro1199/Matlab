n = -5:1:3;
x = [0 0 0 1 1 0 1 2 0];

subplot(3,1,1);
stem(n, x, "filled", Color='#876333');
xlim([-8 7]);
ylim([-2 3]);

subplot(3,1,2);
new_n = n+3;
stem(new_n, x, "filled", Color='#770077');
xlim([-8 7]);
ylim([-2 3]);

new_z = n./3;

subplot(3,1,3);
new_n = n.*1 + 3;
stem(new_z, x, "filled", Color='#770077');
xlim([-8 7]);
ylim([-2 3]);