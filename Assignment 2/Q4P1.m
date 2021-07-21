lb = -1;
ub = 1;
delta = 0.001;
x = lb : delta : ub;

f = sqrt(1 - x .^ 2);

I = myTrapezoidal(f, delta)

Itrapz = delta * trapz(f)

function I = myTrapezoidal(func, delta)
    
    n = length(func);
    I = delta * (sum(func) - (func(1) + func(n))/2.0);
    
end