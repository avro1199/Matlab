clear;
clc;

% calculating the value of k
k = (8 + 6)/2;

% given function
f = @(x) x^3+x^2+x+k;

a = -3;
b = -2;
n = 30;
e = 0.00000001;
is_found = 0;

if (f(a)*f(b) < 0)
    for i = 1:n
        %false position method
        c = ((a*f(b))-(b*f(a)))/(f(b)-f(a));

        %Optional Outut for Data Sheet
        fprintf('(%d)  a = %f; b = %f; Apprx Root(%d) = %.9f\nf(a) = %f; f(b) = %f       f(c) = %f\n\n', i, a, b, i, c,f(a), f(b), f(c));
        %fprintf('Apprx Root(%d) = %f\n', i, c);

        if (abs(c-b)<e || abs(c-a)<e)
            is_found = 1;
            break;
        end
        if (f(a)*f(c)<0)
            b = c;
        elseif (f(b)*f(c)<0)
            a = c;
        end
    end
    if(is_found == 0)
        fprintf('Failed to calculate accurate root within %d iterations!', n);
    elseif(is_found == 1)
        fprintf('Root(correct to three decimal point) found. Root = %.5f', c);
    end
else
    disp('No Roots between given intervals!');
end