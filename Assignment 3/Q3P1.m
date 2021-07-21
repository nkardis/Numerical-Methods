% Boundary Conditions for A

xl_1 = 0;
xu_1 = 1;
r = 1;
Nx = 100;
Pe = 50;

f_1 = UnsteadyStateConvectionDiffusionUB1(xl_1, xu_1, Pe, r, Nx);
[phi, t] = Crank_Nicolson(f_1, Nx, xl_1, 0);

%  Plot
plot(t, phi)
title("Crank Nicolas with Dirichlet BC, t = 0")
xlabel("x")
ylabel("\phi")


function A = UnsteadyStateConvectionDiffusionUB1(xl, xr, Pe, r, Nx)
    x = Grid(xl, xr, r, Nx);
    n = length(x);
    L = zeros(n-1,n-1);
    L(1,1) = 1;
    L(n-1,n-1) = 1;
    phi = zeros(n-1, 1);
     for i = 2 : n - 2
        L(i,i-1) = -(1 / (x(i + 2) - x(i)) ...
        + 2 / (Pe * (x(i + 2) - x(i)) * (x(i + 1) - x(i))));
        L(i,i) = 1 / (x(i + 2) - x(i)) ...
        - 2 / (Pe * (x(i + 2) - x(i)) * (x(i + 2) - x(i + 1)));
        L(i,i+1) = -(L(i,i-1) + L(i,i));
        phi(i) = sin((pi * x(i))/2);
    end
    phi(1) = xl;
    phi(n-1) = xr;
    A = L * phi;
end

function [x, t] = Crank_Nicolson(f, N, x1, t1)
    
    x = zeros(1, N);
    t = zeros(1, N);
    h = 1 / N;
    
    x(1) = x1;
    t(1) = t1;
    
    for i = 2 : N
        x(i) = x(i - 1) + (h / 2) * (f(i - 1) + f(i));
        t(i) = t(i - 1) + h;
    end
end

function [x,t] = Runge_Kutta_SecondOrder(f, N, x1, t1)
    
    % Pre allocating memory
    x = zeros(1, N);
    t = zeros(1, N);
    h = 1 / N;
    
    % Initial conditions
    x(1) = x1;
    t(1) = t1;
    
    for i = 1 : N
        k1 = f(i);
        k2 = f(i) + (h) * k1;
        
        x(i + 1) = x(i) + ((1/2) * k1 + (1/2) * k2) * h;
        t(i + 1) = t(i) + h;
    end

end


