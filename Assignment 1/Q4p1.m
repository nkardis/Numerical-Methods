x = -3:0.01:3;
y = -3:0.01:3;
[x, y] = meshgrid(x, y);

H = (y + 3) .^ 2 + 1.5 .* x .^ 2 - x .^ 2 .* y;

figure(1)
contour(x,y,H);

figure(2)
meshc(x,y,H);