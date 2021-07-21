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

% Calculate Double Partial Derivative in the x direction
mat_x_1D = DD2_x_2D * Fi1D';
mat_x_2D = reshape(mat_x_1D',nx,nx);
mat_x_2D = mat_x_2D';

% Calculate Double Partial Derivative in the y direction
mat_y_1D = DD2_y_2D*Fi1D';
mat_y_2D = reshape(mat_y_1D',ny,ny);
mat_y_2D = mat_y_2D';

% Calculating the TwoDmatrix
matrix = mat_x_2D + mat_y_2D;
end