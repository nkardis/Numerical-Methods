m  = 2;
mu = 0.45;
g = 10;

F = @(theta) (mu*m*g)./(cos(theta) + mu*sin(theta));
dFdx = @(theta) -(mu*m*g.*(mu*cos(theta)-sin(theta)))./(mu*sin(theta)+cos(theta)).^2;
myBracketingMethod(dFdx, 0.3, 0.5)
fzero(dFdx, 0.3)

function xr = myBracketingMethod(func, lb, ub)

xl = lb;
xu = ub;

xr = (xl + xu)/2.0;
fxr = func(xr);
maxiter = 100;
i = 1;

while abs(fxr) > 1.0e-6 && i < maxiter
    
    fxl = func(xl);
    fxu = func(xu);
    fxr = func(xr);
    
    if fxr*fxl < 0
        xu = xr;
    elseif fxr*fxu < 0
        xl = xr;
    end
    
    xr = (xl+xu)/2.0;
    i = i+1;
end

end 

