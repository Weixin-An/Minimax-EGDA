function [grad_z] = my_grad(z)
x = z(1); y = z(2);
if x < y - 1
    dx = 0; dy = 0;
elseif x < y
    dx = -0.5*(x - y) - 0.5;
    dy = 0.5*(x - y) + 0.5;
elseif x < y + 1
    dx = 0.5*(x - y) - 0.5;
    dy = -0.5*(x - y) + 0.5;
else
    dx = 0; dy = 0;
end
grad_z = [dx; -dy];
end

