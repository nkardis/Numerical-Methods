function I = doubleTrapezoidal(func, x, y)
    % No idea how
    I = trapz(y, trapz(x, func, 2));
end

