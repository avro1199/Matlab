%% Ex_no_M2.1
%%%%%% S^3+3S^2+4  %%%%%%%%%%
p = [1 3 0 4]; %% Polynomial coefficients
r = roots(p);  %% roots of Polynomial obtained by roots command.
disp('Reconstruct polynomial from roots')
p = poly(r) %% vector of polynomial coefficients obtained by the command poly.
value_at_sqrt2 = polyval(p, sqrt(2));  %% find a value of PN at s= sqrt(2)
fprintf('Value of the polynomial at s = sqrt(2): %.4f\n', value_at_sqrt2);
%%% multiplying polynomial s^3+ 3s^2+4 with s+2
p1 = [1 3 4];
p2 = [1 2];
disp('convolution result');
p3 = conv(p1,p2)    %% multiplication of p1 & p2 with conv
disp('deconvolution result');
[q,r] = deconv(p1,p2) %% divides two polynomials with deconv, here q (quotient) r (remainder)
%%% condition check
if isequal(p1, conv(q, p2) + r)
    disp('Condition satisfied: p1 = conv(q, p2) + r');
else
    disp('Condition NOT satisfied: p1 ≠ conv(q, p2) + r');
end
