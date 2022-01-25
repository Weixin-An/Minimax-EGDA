function [Norm, zlist, EAG_V_Trajectory] = EAG_V(x0, y0, maxiter)
% initial point
x = x0; y = y0;
z = [x; y]; z0 = z;
% cumulative variables
zlist = z; 
grad_z = my_grad(z);
Norm = norm(grad_z(1))^2 + norm(grad_z(2))^2; 
EAG_V_Trajectory = [z(1); z(2); my_fun(z(1), z(2))];
% parameters
L = 100;
for k = 1:maxiter
    z12 = z + 1/(k+2)*(z0 - z) - (0.618-k*(0.618-0.437)/maxiter)/L * my_grad(z);
    z = z + 1/(k+2)*(z0 - z) - (0.618-k*(0.618-0.437)/maxiter)/L * my_grad(z12);
    grad_z = my_grad(z);
    Norm = [Norm, norm(grad_z(1))^2 + norm(grad_z(2))^2];
    zlist = [zlist, z];
    EAG_V_Trajectory = [EAG_V_Trajectory,[z(1); z(2); my_fun(z(1), z(2))]];
end
end

