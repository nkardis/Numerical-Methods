%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M1 = 1.5;
M2 = 5.0;
alpha = 1.4;

theta_M1 = [5, 10, 15];
theta_M2 = [20, 30, 45];

beta_M1 = linspace(asind(1/M1), 90, 100);
beta_M2 = linspace(asind(1/M2), 90, 100);

n = length(theta_M1);
m = length(beta_M1);

f_beta_M1 = zeros(n, m);
f_beta_M2 = zeros(n, m);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1 : n 
    for j = 1 : m
        f_beta_M1(i,j) = (2 * cotd(beta_M1(j))) * (M1 ^ 2 * sind(beta_M1(j)) ^ 2 - 1) / (M1 ^ 2 * (alpha + cosd(2 * beta_M1(j))) + 2) - tand(theta_M1(i));
        f_beta_M2(i,j) = (2 * cotd(beta_M2(j))) * (M2 ^ 2 * sind(beta_M2(j)) ^ 2 - 1) / (M2 ^ 2 * (alpha + cosd(2 * beta_M2(j))) + 2) - tand(theta_M2(i));
    end
end

theta_1_f_beta_M1 = f_beta_M1(1,:);
theta_2_f_beta_M1 = f_beta_M1(2,:);
theta_3_f_beta_M1 = f_beta_M1(3,:);

theta_1_f_beta_M2 = f_beta_M2(1,:);
theta_2_f_beta_M2 = f_beta_M2(2,:);
theta_3_f_beta_M2 = f_beta_M2(3,:);

figure(1)
hold on
grid on
plot(beta_M1, theta_1_f_beta_M1);
plot(beta_M1, theta_2_f_beta_M1);
plot(beta_M1, theta_3_f_beta_M1);
xlabel("\beta (degrees)")
ylabel("f(\beta)")
title("M = 1.5, f(\beta) vs \beta, \theta¸ = 5, 10, 15)")
legend("\theta = 5", "\theta = 10", "\theta = 15")
hold off

figure(2)
hold on
grid on
plot(beta_M2, theta_1_f_beta_M2);
plot(beta_M2, theta_2_f_beta_M2);
plot(beta_M2, theta_3_f_beta_M2);
xlabel("\beta (degrees)")
ylabel("f(\beta)")
title("M = 5, f(\beta) vs \beta, \theta¸ = 20, 30, 45)")
legend("\theta = 20", "\theta = 30", "\theta = 45")
hold off


