RMSE = [5, 2e-2, 3e-4, 5e-4, 10e-3]
x = [10, 100, 500, 600, 1000]

loglog(x, RMSE)
grid on
title("RMSE using Gauss-Lobatto with Evenly spaced nodes")
xlabel("Number of Nodes")
ylabel("RMSE")