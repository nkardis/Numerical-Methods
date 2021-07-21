function x = thomasAlgorithm(alpha, beta, gamma, Q)
    
    n = length(beta);
    
    % Preallocating memory
    x = zeros(n, 1);
    newBeta = zeros(1, n);
    newQ = zeros(n, 1);
    
    for i = 1 : n
        if i == 1
            % Special condition if first element in array
            newBeta(i) = beta(i);
            newQ(i) = Q(i);
        else
            % Standard condition for beta and Q
            newBeta(i) = beta(i) - (alpha(i - 1) * gamma(i - 1)) / newBeta(i - 1);
            newQ(i) = Q(i) - (alpha(i - 1) * newQ(i - 1)) / newBeta(i - 1);
        end
    end
    
    for i = n : -1 : 1
        if i == n
            % Special condition for end of array
            x(i) = newQ(i) / newBeta(i);
        else
            % Standard condition for x
            x(i) = (newQ(i) - gamma(i) * x(i + 1)) / newBeta(i);
        end
    end
end