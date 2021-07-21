syms x
f = 1 / (1 - x);
for i = 1 : 5
    Tc(i) = taylor(f, x, 2, 'Order', i);
end

figure(2)
fplot([f Tc(1) Tc(2) Tc(3) Tc(4) Tc(5)]);
grid on
hold on
xlim([0 5])
ylim([-20 20])
legend('1 / (1 - x)', 'O(x)', 'O(x^2)', 'O(x^3)', 'O(x^4)', 'O(x^5)')
hold off

Tc