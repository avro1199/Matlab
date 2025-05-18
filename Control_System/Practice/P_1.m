clear;
clc;

p1 = [1 3 4];
p2 = [1 2];

[q, r] = deconv(p1, p2);  % p1/p2 => q, r

% p1 = q*p2 + r;

np = conv(p2, q) + r;

if isequal(p1, np)
    disp('Equal')
end