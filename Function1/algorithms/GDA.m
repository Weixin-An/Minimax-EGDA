function [Norm, zlist, GDA_Trajectory] = GDA(x0, y0, maxiter)
% initialization point
x = x0;
y = y0;
z = [x; y];
% Cumulative parameters
zlist = z;
grad_z = my_grad(z);
Norm = norm(grad_z(1))^2 + norm(grad_z(2))^2; 
GDA_Trajectory = [z(1); z(2); my_fun(z(1), z(2))]; 
% parameters 
alpha = 0.01;
% main loop
for k = 1:maxiter
    z = z - alpha * grad_z;
    grad_z = my_grad(z);
    zlist = [zlist, z];
    Norm = [Norm, norm(grad_z(1))^2 + norm(grad_z(2))^2];
    GDA_Trajectory = [GDA_Trajectory,[z(1); z(2); my_fun(z(1), z(2))]];
end
end

