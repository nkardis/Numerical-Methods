% Varying N values can allow the algorithm to approach the exact solution
% however by increasing N, it is increasing the amount of iterations 
% Slowing down the computation a lot. Meaning whilst keeping r = 1.0,
% with steady points, we have increased how long it takes to compute a 
% solution. When varying r values, we can reach an approximate solution
% similar r = 1.0 with half as many iterations. However when we decrease 
% our r value too much, the x values produced are too bunched up towards 
% the end of the domain causing a lot of error.

Pe = 50;
lb = 0;
ub = 1;

% Exact case
x_exact = Grid(0, 1, 1, 100);
phi_exact = lb + ((exp(x_exact .* Pe) - 1) ./ (exp(Pe) - 1)) .* (ub - lb);

% Case 1
r_1 = 1.0;
N_1 = 10;

[phi_1, x_1] = steadyStateConvectionDiffusion(lb, ub, Pe, N_1, r_1);

% Case 2
r_2 = 1.0;
N_2 = 20;

[phi_2, x_2] = steadyStateConvectionDiffusion(lb, ub, Pe, N_2, r_2);
plot(x_2, phi_2, 'r')

% Case 3
r_3 = 1.0;
N_3 = 100;

[phi_3, x_3] = steadyStateConvectionDiffusion(lb, ub, Pe, N_3, r_3);
% Case 4
r_4 = 0.7;
N_4 = 10;

[phi_4, x_4] = steadyStateConvectionDiffusion(lb, ub, Pe, N_4, r_4);

% Case 5
r_5 = 0.2;
N_5 = 10;

[phi_5, x_5] = steadyStateConvectionDiffusion(lb, ub, Pe, N_5, r_5);

% Plotting

tiledlayout(2, 1);
ax1 = nexttile;
ax2 = nexttile;

% Subplot 1 (Cases 1, 2, 3 with exact)
title(ax1, "Cases 1, 2, 3 with exact solution")
hold(ax1, 'on')
grid(ax1, 'on')

plot(ax1, x_1, phi_1, '-ob')
plot(ax1, x_2, phi_2, '-dr')
plot(ax1, x_3, phi_3, '-sg')
plot(ax1, x_exact, phi_exact, 'k')

legend(ax1, "Case 1, r = 1.0, N = 10", "Case 2, r = 1.0, N = 20", ...
    "Case 3, r = 1.0, N = 100", "Exact solution", 'Location', 'northwest')
xlabel(ax1, "x (m)")
ylabel(ax1, "\phi(x)")

hold(ax1, 'off')

% Subplot 2 (Cases 1, 4, 5 with exact)
title(ax2, "Cases 1, 4, 5 with exact solution")
hold(ax2, 'on')
grid(ax2, 'on')

plot(ax2, x_1, phi_1, '-ob')
plot(ax2, x_4, phi_4, '-dr')
plot(ax2, x_5, phi_5, '-sg')
plot(ax2, x_exact, phi_exact, 'k')

legend(ax2, "Case 1, r = 1.0, N = 10", "Case 4, r = 0.7, N = 10", ...
    "Case 5, r = 0.2, N = 10", "Exact solution", 'Location', 'northwest')
xlabel(ax2, "x (m)")
ylabel(ax2, "\phi(x)")

hold(ax2, 'off')


%%%% Functions %%%%

function [phi, x] = steadyStateConvectionDiffusion(xl, xr, Pe, N, r)
    x = Grid(xl, xr, r, N);
    n = length(x);
    
    
    ain = zeros(1, n - 2);
    bin = zeros(1, n - 1);
    gin = zeros(1, n - 2);
    Qin = zeros(n - 1, 1);
    for i = 1 : n - 2
        ain(i) = -(1 / (x(i + 2) - x(i)) ...
            + 2 / (Pe * (x(i + 2) - x(i)) * (x(i + 2) - x(i + 1))));
        gin(i) = 1 / (x(i + 2) - x(i)) ...
            - 2 / (Pe * (x(i + 2) - x(i)) * (x(i + 2) - x(i + 1))); 
        bin(i) = -(ain(i) + gin(i)); 
    end
    
    Qin(1) = - xl * ain(1);
    Qin(n-1) = - xr * gin(n-2);
    bin(n-1) = -(ain(n-2) + gin(n-2));
    
    
    phi = thomasAlgorithm(ain, bin, gin, Qin);
    phi(1) = xl;
    phi(n) = xr;
end

function x = thomasAlgorithm(alpha, beta, gamma, Q)
    
    n = length(beta);
    
    % Preallocating memory
    x = zeros(n, 1);
    newBeta = zeros(1, n);
    newQ = zeros(n, 1);
    
    for i = 1 : n
        if i == 1
            % Special condition if first element in array
            newBeta(i) = beta(i);
            newQ(i) = Q(i);
        else
            % Standard condition for beta and Q
            newBeta(i) = beta(i) - (alpha(i - 1) * gamma(i - 1)) / newBeta(i - 1);
            newQ(i) = Q(i) - (alpha(i - 1) * newQ(i - 1)) / newBeta(i - 1);
        end
    end
    
    for i = n : -1 : 1
        if i == n
            % Special condition for end of array
            x(i) = newQ(i) / newBeta(i);
        else
            % Standard condition for x
            x(i) = (newQ(i) - gamma(i) * x(i + 1)) / newBeta(i);
        end
    end
end

%%%%%%%%%%%%%%%%%%%
