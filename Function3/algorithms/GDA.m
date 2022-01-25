function [Norm, zlist, GDA_Trajectory] = GDA(x0, y0, maxiter)
% initial point
x = x0; y = y0;
z = [x; y];
% cumulative variables
zlist = z;
grad_z = my_grad(z);
Norm = norm(grad_z(1))^2 + norm(grad_z(2))^2; 
GDA_Trajectory = [z(1); z(2); my_fun(z(1), z(2))]; 
% parameters 
yita = [0.01; 0.02];
% main loop
for k = 1:maxiter
    z = z - yita .* grad_z;
    grad_z = my_grad(z);
    zlist = [zlist, z];
    Norm = [Norm, norm(grad_z(1))^2 + norm(grad_z(2))^2];
    GDA_Trajectory = [GDA_Trajectory,[z(1); z(2); my_fun(z(1), z(2))]];
end
end

