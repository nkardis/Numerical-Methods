f = @(x) 2*sin(3*x) - exp(x/4) + 2;


max_iter = 100;
guesses = [1.2 2 3.2];
n = length(guesses);

results = zeros(1, n);

for i = 1 : n
    x = guesses(i);
    x = fzero(f,x);
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


results