clear;
clc;

syms x f(x);

X = [15,20,25,30,35,40];
Y = [.2588190,.3420201,.4226183,.5,.5735764,.6427876];

n = length(X);

p = (x-X(n))/(X(n)-X(n-1));

del = zeros(n,n);

del(:,1) = Y';

for j = 2:n
    for i = n:-1:j
        del(i,j) = del(i,j-1) - del(i-1,j-1);
    end
end

% f(x) = Y(n) + p*del(6,2) + p*(p+1)*del(6,3)/factorial(2) + p*(p+1)*(p+2)*del(6,4)/factorial(3) + p*(p+1)*(p+2)*(p+3)*del(6,5)/factorial(4) + p*(p+1)*(p+2)*(p+3)*(p+4)*del(6,6)/factorial(5);

term = p;
f(x) = Y(n);

for t = 2:n
    f(x) = f(x) + term * del(6,t);
    term = term * (p+t-1) / t;
end


while(1)
    value = input('Please Enter the value of X (Enter 0 to exit):');
    if(value == 0)
        break;
    else
        fprintf('Interpolation Result @(%.0f) => %.9f \n' , value, f(value));
        fprintf(' Original Result (Sin(%.0f)) => %.9f\n\n', value, sind(value));
    end
end