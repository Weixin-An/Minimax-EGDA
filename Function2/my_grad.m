function [grad_z] = my_grad(z)
x = z(1); y = z(2);
dx = exp(x) / (1 + exp(x)) + 3*y;
dy = 3*x - exp(y) / (1 + exp(y));
grad_z = [dx; -dy];
% dx = 0; dy = 0; 
x = 0.1518; y = -0.1793;
dxx = (exp(x) * (1 - exp(x)) - exp(x)^2)  / (1 + exp(x))^2;
dyy = -(exp(y) * (1 - exp(y)) - exp(y)^2)  / (1 + exp(y))^2;
dxy = 3;
dxx * dyy - dxy^2 < 0;
% so (0.1518, -0.1793) is a saddle point
end

