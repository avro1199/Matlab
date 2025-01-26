num = [2 3 1];
den = [1 4 3];
Y = tf(num, den)
zeros_of_Y = roots(num); %% Points where Y(s) = 0
poles_of_Y = roots(den); %% Points where Y(s) = Infinity

%%%     Results for Y(s)
fprintf('Zeros of Y(s) (Y(s) = 0): %s\n', mat2str(zeros_of_Y));
fprintf('Poles of Y(s) (Y(s) = Infinity): %s\n', mat2str(poles_of_Y));