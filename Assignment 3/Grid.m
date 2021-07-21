%%% Question 1 Part 2 %%%

function d = Grid(xl, xr, r, N)
    d = zeros(1,N+1);
    d(1) = xl;
    d(N+1) = xr;
    if r == 1
        for i = 2 : N
            d(i) = (xr + xl) / N + d(i-1);
        end
    else
        for i = 2 : N
            d(i) = (r ^ (i - 2))*(xr - xl) * ((1 - r) / (1 - r ^ N)) ...
                + d(i-1);
        end
    end
end
