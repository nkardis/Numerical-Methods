H = @(x,y) (y + 3) .^ 2 + 1.5 .* x .^ 2 - x .^ 2 .* y;
dHdx = @(x,y) 3 * x - 2 * x * y;
dHdy = @(x,y) 2 * y + 6 - x ^ 2;

tol = 1e-8;
max_iter = 100;
x = 1;
y = 1;
X = [];
Y = [];
i = 1;

while abs(H(x,y)) > tol
    x = x - (H(x,y))/dHdx(x,y);
    y = y - (H(x,y))/dHdy(x,y);
    X = [x x - (H(x,y))/dHdx(x,y)];
    Y = [y y - (H(x,y))/dHdy(x,y)];
    i = i + 1;
end

[X, Y] = meshgrid(X,Y)
contour(X, Y, H)