tdata = [0.0 0.5 1 2 3 8];
vdata = [0.0 11.2 13.0 14.7 16.1 16.0];

v = Q3P1LagrangeInterpolatio(tdata, vdata);
t = linspace(tdata(1), tdata(6), 100);

plot(t,v,'b-','Linewidth',2)
xlabel('t (seconds)')
ylabel('v(t) (m/s)')
hold on
plot(tdata,vdata,'ko','MarkerSize',8,'MarkerFaceColor','r')
legend("Lagrange Interpolation", "Known values")
grid on
hold off

function f = Q3P1LagrangeInterpolatio(tdata, vdata)

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


        
    