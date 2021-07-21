M = 5;
alpha = 1.4;

beta = linspace(asind(1/M), 90, 100);

theta = atand((2 .* cotd(beta) .* (M .^ 2 .* sind(beta) .^ 2 - 1)) ./ (M .^ 2 .* (alpha + cosd(2 .* beta)) + 2));

plot(theta, beta);

grid on
xlabel("\theta (degrees)")
ylabel("\beta (degrees)")
legend("\beta vs \theta")
text(25,70, "\theta ~ 41 degrees")