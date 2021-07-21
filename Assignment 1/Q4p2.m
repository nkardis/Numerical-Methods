x = -3:0.005:3;
y = -3:0.005:3;
[x, y] = meshgrid(x, y);

H = (y + 3) .^ 2 + 1.5 .* x .^ 2 - x .^ 2 .* y;

[n , n] = size(H);

% Doesn't accept 1 value for contour lines (?)
contour(x, y, H, [20 45])
