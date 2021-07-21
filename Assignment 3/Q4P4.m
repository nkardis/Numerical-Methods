f = @(x,y) 10 * sin(8 .* x .* (y - 1));
n = 20;

[x_1, y_1, u_1] = Poisson_solve(f, n, "Even");
[X_1, Y_1] = meshgrid(x_1, y_1);

%[x_2, y_2, u_2] = Poisson_solve(f, n, "GLo");
