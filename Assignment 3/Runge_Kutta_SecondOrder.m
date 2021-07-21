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