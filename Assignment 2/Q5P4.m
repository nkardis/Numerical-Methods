load Q5data.mat

x_lb = -5;
x_ub = 5;
y_lb = -5;
y_ub = 5;

Nx = 1000;
Ny = 200;

x = linspace(x_lb, x_ub, Nx);
y = linspace(y_lb, y_ub, Ny);

[X, Y] = meshgrid(x,y);

f = X .* Y;

I = doubleTrapezoidal(f, x, y)
