u = @(x,y) sin(pi.*x).*cos(pi.*y);
u_Real = @(x,y) -2.*pi^2.*sin(pi.*x).*cos(pi.*y);

Nx = 100;
Ny = 100;

x = linspace(-1,1,Nx);
y = linspace(-1,1,Ny);

[X,Y] = meshgrid(x,y);

Kron_Matrix = KronMatrix_2D(x,y,Nx,Ny,u);

% Plotting
tiledlayout(2,2);
ax1 = nexttile;
ax2 = nexttile;
ax3 = nexttile;
ax4 = nexttile;

% Plot the real function 
u_Real = u_Real(X,Y);
contour(ax1, X, Y, u_Real)
xlabel(ax1, 'x')
ylabel(ax1, 'y')
title(ax1, 'Contour Plot of analytical answer')

surf(ax2, X, Y, u_Real)
xlabel(ax2, 'x')
ylabel(ax2, 'y')
zlabel(ax2, 'z')
title(ax2, 'Surf Plot of analytical answer')

% Plot the analytical function (Kron)
contour(ax3, X, Y, Kron_Matrix)
xlabel(ax3, 'x')
ylabel(ax3, 'y')
title(ax3, 'Contour Plot from Kron')

surf(ax4, X, Y, Kron_Matrix)
xlabel(ax4, 'x')
ylabel(ax4, 'y')
zlabel(ax4, 'z')
title(ax4, 'Surf Plot from Kron')

function matrix = KronMatrix_2D(x, y, nx, ny, f)

[X,Y] = meshgrid(x,y);
x_delta = x(2) - x(1);
y_delta = y(2) - y(1);

% Double Derivative matrix for internal nodes
DD2_x = diag(- 2 * ones(1, nx)) + diag(ones(1, nx - 1), 1) ...
    + diag(ones(1, nx - 1), - 1);

%Have to treat boundaries differently
DD2_x(1, 1) = 1.0;
DD2_x(1, 2) = - 2;
DD2_x(1, 3) = 1;
DD2_x(nx, nx) = 1.0;
DD2_x(nx, nx - 1) = -2;
DD2_x(nx, nx - 2) = 1;
DD2_x = DD2_x / x_delta ^ 2;

% Double Derivative matrix for internal nodes
DD2_y = diag(- 2 * ones(1, ny)) + diag(ones(1, ny - 1), 1) ...
    + diag(ones(1, ny - 1), - 1);

% Have to treat boundaries differently
DD2_y(1, 1) = 1.0;
DD2_y(1, 2) = - 2;
DD2_y(1, 3) = 1;
DD2_y(ny, ny) = 1.0;
DD2_y(ny, ny - 1) = -2;
DD2_y(ny, ny - 2) = 1;
DD2_y = DD2_y / y_delta ^ 2;

% Row wise concatenation
Fi = f(X,Y);
Fi1D = reshape(Fi',1,[]);
DD2_x_2D = kron(eye(nx, nx), DD2_x);
DD2_y_2D = kron(DD2_y, eye(nx, nx));


% Final matrix calculation

mat_x_1D = DD2_x_2D * Fi1D';
mat_x_2D = reshape(mat_x_1D',nx,nx);
mat_x_2D = mat_x_2D';

mat_y_1D = DD2_y_2D*Fi1D';
mat_y_2D = reshape(mat_y_1D',ny,ny);
mat_y_2D = mat_y_2D';

matrix = mat_x_2D + mat_y_2D;
end