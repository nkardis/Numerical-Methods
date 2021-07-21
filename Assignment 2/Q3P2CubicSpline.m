tdata = [0.0 0.5 1 2 3 8];
vdata = [0.0 11.2 13.0 14.7 16.1 16.0];

[a, b, c, d] = CubicSplineCoefficients(tdata, vdata);
n = length(tdata) - 1;
t = linspace(tdata(1), tdata(n+1), 10000);
v = CubicSplineEval(a, b, c, d, tdata, t);

hold off
plot(tdata,vdata,'ko','MarkerSize',8,'MarkerFaceColor','r')
hold on
plot(t,v,'b-','Linewidth',2)
xlabel('t (seconds)')
ylabel('v(t) (m/s)')
legend("Known values", "Cubic Spline Interpolation")
grid on
hold off

function fi = CubicSplineEval(a, b, c, d, xdata, xi)
    
    n = length(xdata) - 1;
    fi = zeros(1, length(xi));
    
    for i = 1 : length(xi)
        for j = 1 : n
            if xdata(j) > xi(i)
                j = j - 1;
                break
            end
        end
        fi(i) = a(j) + b(j)*(xi(i) - xdata(j)) + c(j) * (xi(i) - xdata(j)) ^ 2 + d(j) * (xi(i) - xdata(j)) ^ 3;
    end
end

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