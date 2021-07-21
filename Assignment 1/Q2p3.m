f = @(x) 2*sin(3*x) - exp(x/4) + 2;
dfdx = @(x) 6*cos(3*x) - exp(x/4)/4;

tol = 1e-8;
max_iter = 100;
x = 1.2;

while abs(f(x)) > tol && j < max_iter
    x = x - (f(x))/dfdx(x);
    j = j + 1;
end


g = @(x) 2*sin(3*x) - exp(x/4);
fplot(g);
grid on
hold on
xlim([1 1.3]);
ylim([-3 -1]);

plot(1.2, g(1.2), '.r');
plot(x, g(x), '.r')

hold off