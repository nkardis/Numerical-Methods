M = 1.5;
alpha = 1.4;
theta = 5;

beta = linspace(asind(1/M), 90, 10000);

f_beta = (2 .* cotd(beta)) .* (M ^ 2 .* sind(beta).^ 2 - 1) ./ (M ^ 2 .* (alpha + cosd(2 .* beta)) + 2) - tand(theta);

plot(beta, f_beta);