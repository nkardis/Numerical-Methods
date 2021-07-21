f = @(x) 2*sin(3*x) - exp(x/4) + 2;
dfdx = @(x) 6*cos(3*x) - exp(x/4)/4;

tol = 1e-8;
max_iter = 100;
guesses = [1.2 2 3.2];
n = length(guesses);

results = zeros(1, n);


for i = 1 : n
    x = guesses(i);
    while abs(f(x)) > tol && j < max_iter
        x = x - (f(x))/dfdx(x);
        j = j + 1;
    end
    results(i) = x;
end

g = @(x) 2*sin(3*x) - exp(x/4);
fplot(g);
grid on
hold on
xlim([0 5]);

plot(results(1), g(results(1)), '.r')
plot(results(2), g(results(2)), '.r')
plot(results(3), g(results(3)), '.r')
hold off

disp(results)
