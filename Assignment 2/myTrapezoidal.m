function I = myTrapezoidal(func, delta)
    
    n = length(func);
    I = delta * (sum(func) - (func(1) + func(n))/2.0);
    
end