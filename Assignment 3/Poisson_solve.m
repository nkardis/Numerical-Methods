function [x,y,u] = Poisson_solve(f,N,method)
    
% INPUTS
% f 	 - Forcing term
% N 	 - order of the mesh
% method - Grid type: evenly spaced or GLo
% OUTPUTS
% x  	 - x points
% y	 - y points
% u	 - u values

    if method == "Even"
        x = linspace(-1, 1, N) .^ 2;
        y = linspace(-1, 1, N) .^ 2;
    elseif method == "GLo"
        [x, w, P] = lglnodes(N);
        [y, w, P] = lglnodes(N);
    end
    
    u = KronMatrix_2D(x, y, N, N, f);
    
    
end

function [x,w,P]=lglnodes(N)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% lglnodes.m
%
% Computes the Legendre-Gauss-Lobatto nodes, weights and the LGL Vandermonde 
% matrix. The LGL nodes are the zeros of (1-x^2)*P'_N(x). Useful for numerical
% integration and spectral methods. 
%
% Reference on LGL nodes and weights: 
%   C. Canuto, M. Y. Hussaini, A. Quarteroni, T. A. Tang, "Spectral Methods
%   in Fluid Dynamics," Section 2.3. Springer-Verlag 1987
%
% Written by Greg von Winckel - 04/17/2004
% Contact: gregvw@chtm.unm.edu
% This MATLAB Function is taken from MATLAB Central File Exchange
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Truncation + 1
N1=N+1;
% Use the Chebyshev-Gauss-Lobatto nodes as the first guess
x=cos(pi*(0:N)/N)';
% The Legendre Vandermonde Matrix
P=zeros(N1,N1);
% Compute P_(N) using the recursion relation
% Compute its first and second derivatives and 
% update x using the Newton-Raphson method.
xold=2;
while max(abs(x-xold))>eps
    xold=x;
        
    P(:,1)=1;    P(:,2)=x;
    
    for k=2:N
        P(:,k+1)=( (2*k-1)*x.*P(:,k)-(k-1)*P(:,k-1) )/k;
    end
     
    x=xold-( x.*P(:,N1)-P(:,N) )./( N1*P(:,N1) );
             
end
w=2./(N*N1*P(:,N1).^2);


end