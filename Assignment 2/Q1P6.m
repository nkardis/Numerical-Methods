M = [1.5 3.0 4 5];
alpha = 1.4;

for i = 1 : length(M)
    beta = linspace(asind(1 / M(i)), 90, 100);
    theta = atand((2 .* cotd(beta) .* (M(i) .^ 2 .* sind(beta) .^ 2 - 1)) ./ (M(i) .^ 2 .* (alpha + cosd(2 .* beta)) + 2));
    plot(theta, beta)
    hold on
end
hold off
xlabel("\theta (degrees)")
ylabel("\beta (degrees)")
legend("M = 1.5", "M = 3.0", "M = 4.0", "M = 5.0")
grid on
