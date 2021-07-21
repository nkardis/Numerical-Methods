f = @(x, y) -2 * pi ^ 2 .* sin(pi .* x) .* sin(pi .*y);
N = 100;

[x, y, u] = Poisson_solve(f, N, "Even");

surf(x, y, u)
xlabel("x")
ylabel("y")
zlabel("u(x,y)")