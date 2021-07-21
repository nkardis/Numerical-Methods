function [phi, x] = UnsteadyStateConvectionDiffusionUB2(xl, xr, Pe, r, Nx)
    x = Grid(xl, xr, r, Nx);
    n = length(x);
    
    
    ain = zeros(1, n - 2);
    bin = zeros(1, n - 1);
    gin = zeros(1, n - 2);
    Qin = zeros(n - 1, 1);
    for i = 1 : n - 2
        if i ~= n - 2
            ain(i) = (1 / (x(i + 2) - x(i)) ...
                + 2 / (Pe * (x(i + 2) - x(i)) * (x(i + 2) - x(i + 1))));
            gin(i) = -1 / (x(i + 2) - x(i)) ...
                + 2 / (Pe * (x(i + 2) - x(i)) * (x(i + 2) - x(i + 1))); 
            bin(i) = -(ain(i) + gin(i)); 
            
        else

        
    end
    
    Qin(1) = - xl * ain(1);
    Qin(n-1) = - xr * gin(n-2);
    bin(n-1) = -(ain(n-2) + gin(n-2));
    
    phi = thomasAlgorithm(ain, bin, gin, Qin);
    phi(1) = xl;
    phi(n) = xr;
end