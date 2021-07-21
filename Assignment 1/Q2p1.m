syms x
f = 2*sin(3*x) - exp(x/4);

fplot(f)
xlim([0 5])
grid on

text(2,1, "Guesses : x ~ 1.2, 2, 3.2")