% First function
h = @(x) sin(x);
h_lb = 0;
h_ub = pi;

% Second function
f = @(y) y;
f_lb = 0;
f_ub = 2;

I_x = genTrapezoidal(h, h_lb, h_ub);
I_y = genTrapezoidal(f, f_lb, f_ub);

I_xy = I_x * I_y

function I = genTrapezoidal(f, lb, ub)
    
    delta = 0.001;
    n = length(lb : delta : ub);
    step = (ub-lb)/n;
    sum = 0.5*(f(ub)+f(lb));
    
    for i = 1:n-1
        sum = sum + f(lb + i*step);
    end
    
    I = step*sum;
end