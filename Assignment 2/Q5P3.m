load Q5data.mat

xdata= Xi;
ydata = Yi;
fdata = Fi;

[a, b, c, d] = CubicSplineCoefficients(xdata, fdata);
[e, f, g, h] = CubicSplineCoefficients(ydata, fdata);
n = length(xdata) - 1;
m = length(ydata) - 1;
x = linspace(xdata(1), xdata(n+1), 10000);
y = linspace(ydata(1), ydata(m+1), 10000);
z1 = CubicSplineEval(a, b, c, d, xdata, x);
z2 = CubicSplineEval(e, f, g, h, ydata, y);

[Z1 Z2] = meshgrid(z1,z2);

contour(Z1,Z2,Fi)
