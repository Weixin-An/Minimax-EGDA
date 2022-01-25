function [grad_z] = my_grad(z)
x = z(1); y = z(2);
dx = 2*x + 3*sin(y)^2 * 2 * sin(x)*cos(x);
dy = 3*sin(x)^2 * 2 * sin(y) * cos(y) - 8 * y - 20 * sin(y) * cos(y);
grad_z = [dx; -dy];
% dx = 0; dy = 0;
% dxx = 2 + 6 * sin(y)^2 * (cos(x)^2 - sin(x)^2) = 2 > 0
% dyy = 6 * sin(x)^2 * (cos(y)^2 - sin(y)^2) - 8 - 20 * (cos(y)^2 -
% sin(y)^2) = -28 < 0
% dxy = 6 * sin(x) * cos(x) * 2 * sin(y) * cos(y) = 0
% dxx * dyy - dxy^2 < 0
% 所以(0, 0) 是鞍点
end

