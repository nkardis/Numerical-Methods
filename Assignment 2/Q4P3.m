% Q4 P3

x_lb = 0;
x_ub = pi;
y_lb = 0;
y_ub = 2;

Nx = 1000;
Ny = 200;

x = linspace(x_lb, x_ub, Nx);
y = linspace(y_lb, y_ub, Ny);

[X, Y] = meshgrid(x,y);

f = Y .* sin(X);

I = doubleTrapezoidal(f, x, y)

function I = doubleTrapezoidal(func, x, y)
    % No idea how
    I = trapz(y, trapz(x, func, 2));
end
