function [a, b, c, d] = CubicSplineCoefficients(xdata, fdata)
    
    n = length(xdata) - 1;
    a = zeros(1, n + 1);
    b = zeros(1, n + 1);
    c = zeros(1, n + 1);
    d = zeros(1, n + 1);
    h = zeros(1, n + 1);
    
    alpha = zeros(1, n);
    beta = zeros(1, n + 1);
    gamma = zeros(1, n); 
    Q = zeros(n + 1, 1);
    
    % Calculates a values
    for i = 1 : n + 1
        a(i) = fdata(i);
    end
    
    % Calculates h(i) = x(i + 1) - x(i)
    for i = 1 : n
        h(i) = xdata(i + 1) - xdata (i);
    end
    
    % Calculates alpha values for tridiagonal matrix for c
    for i = 1 : n
        if i == n
            alpha(i) = 0;
        else
            alpha(i) = h(i);
        end
    end
    
    % Calculates beta values for tridiagonal matrix for c
    for i = 1 : n + 1
        if i == 1 || i == n + 1
            beta(i) = 1;
        else
            beta(i) = 2 * (h(i - 1) + h(i));
        end
    end
    
    % Calculates gamma values for tridiagonal matrix for c
    for i = 1 : n
        if i == 1
            gamma(i) = 0;
        else
            gamma(i) = h(i);
        end
    end
    
    % Calculates Q values for tridiagonal matrix for c
    for i = 1 : n + 1
        if i == 1 || i == n + 1
            Q(i) = 0;
        else
            Q(i) = (3 / h(i)) * (a(i + 1) - a(i)) + (3 / h(i - 1)) * (a(i - 1) - a(i));
        end
    end
    
    c = thomasAlgorithm(alpha, beta, gamma, Q);
    c = c';
    
    % Calculates b and d values
    for i = 1 : n
        b(i) = (1 / h(i)) * (a(i + 1) - a(i)) - (h(i) / 3) * (2 * c(i) + c(i + 1));
        d(i) = (c(i + 1) - c(i)) / (3 * h(i));
    end
    
end