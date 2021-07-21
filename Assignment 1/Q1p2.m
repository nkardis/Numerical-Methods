syms x
f = 1 / (1 - x);
T = 0;
figure(1)
hold on
grid on
fplot(f);

for i = 0 : 4
    T = T + (-1)^(i+1) * (x - 2)^i
    fplot(T)
end


grid on
xlim([0 5])
ylim([-20 20])
legend('1 / (1 - x)', 'O(x)', 'O(x^2)', 'O(x^3)', 'O(x^4)', 'O(x^5)')
hold off