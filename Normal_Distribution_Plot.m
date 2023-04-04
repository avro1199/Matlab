clear;
clc;

syms x sigma miu;

f(sigma,miu) = (1/(sigma*sqrt(2*pi)))*exp(-.5*((x-miu)/sigma)^2);

sg = [0:.5:2];
mu = [0,-.5,-1,.5,1];

subplot(3,1,1);
fplot(f(.5,0),LineWidth=1);
grid on;
legend ('σ=0.5,μ=0');
xlabel ('x');
ylabel ('f(x)');
title ('deltaPlot\_2020338005','Normal Distribution');

subplot(3,1,2);
for i = 1:5
    if(sg(i) == 0)
        continue;
    end
    fplot(f(sg(i),0),LineWidth=1);
    hold on;
    grid on;
    xlabel ('x');
    ylabel ('f(x)');
end
title ('for different values of σ');

subplot(3,1,3);
for i = 1:5
    fplot(f(1,mu(i)),LineWidth=1);
    hold on;
    grid on;
    xlabel ('x');
    ylabel ('f(x)');
end
title ('for different values of μ');