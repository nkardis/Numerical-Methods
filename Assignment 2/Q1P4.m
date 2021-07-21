M = 5;
theta = 20;
alpha = 1.4;

beta = linspace(asind(1/M), 90, 100);
f = (2 .* cotd(beta) .* (M .^ 2 .* sind(beta) .^ 2 - 1)) ./ (M .^ 2 .* (alpha + cosd(2 .* beta)) + 2) - tand(20);
f_beta = @(beta)(2 * cotd(beta) * (M ^ 2 * sind(beta) ^ 2 - 1)) / (M ^ 2 * (alpha + cosd(2 * beta)) + 2) - tand(20);

root1 = myBracketingMethod(f_beta, 28, 30);
root2 = myBracketingMethod(f_beta, 82, 90);

plot(beta, f);
hold on
grid on
plot(root1, f_beta(root1), '.r', "MarkerSize", 12);
plot(root2, f_beta(root2), '.r', "MarkerSize", 12);
hold off
title("f(\beta) vs \beta, M = 5, \theta = 20")
xlabel("\beta (degrees)")
ylabel("f(\beta)")
legend("f(\beta) vs \beta", "\theta = 29.8 and 84.55")

 
 function xr = myBracketingMethod(func, lb, ub)

xl = lb;
xu = ub;

xr = (xl + xu)/2.0;
fxr = func(xr);
maxiter = 100;
i = 0;

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