function f = LagrangeInterpolation(tdata, vdata)

    n = length(tdata);
    t = linspace(tdata(1), tdata(n), 100);
    N = length(t);
    f = zeros(1, N);
    
    for k = 1 : N
        for i = 1 : n
            Lit = 1;
            for j = 1 : n
                if j ~= i
                    Lit = Lit * (t(k) - tdata(j)) / (tdata(i) - tdata(j));
                end
            end
            f(k) = f(k) + vdata(i) * Lit;
        end
    end
    
end


        
    