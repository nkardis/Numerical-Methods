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
    x(N + 1) = x(N) + (h / 2) * (f(N) + f(N+1));
    t(N + 1) = t(N) + h;
    
    
    
end