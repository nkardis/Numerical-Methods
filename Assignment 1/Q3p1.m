m  = 2;
mu = 0.45;
g = 10;
theta = linspace(0, pi/2);

F = (mu*m*g)./(cos(theta) + mu*sin(theta));
min(F)
plot(theta, F);