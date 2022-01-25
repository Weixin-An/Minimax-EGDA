function [Norm, zlist, EGDA_Trajectory] = EGDA(x0, y0, maxiter)
% initial point
x = x0; y = y0;
z = [x; y]; 
z_12 = z - randn(2,1); % add a small disturbance
% parameters
alpha = [0.1;0.2]; tau0 = 0.1; tau1 = 0.9;
% cumulative variables
zlist = z; 
grad_z = my_grad(z);
Norm = norm(grad_z(1))^2 + norm(grad_z(2))^2; 
EGDA_Trajectory = [z(1); z(2); my_fun(z(1), z(2))];
% main loop
for k = 1:maxiter
    alphak = alpha; % maybe decay step size
    z12 = z - alphak .* my_grad(z);
    p = tau0 * my_grad(z) - tau1 * my_grad(z_12);
    q = my_grad(z12);
    for i = 1:length(z)
        if abs(p(i)) <= abs(q(i))
            g(i) = p(i);
        else
            g(i) = q(i)^2 / p(i);
        end
    end
    z = z - alphak .* my_grad(z_12) - alphak .* g;
    z_12 = z12;
    grad_z = my_grad(z);
    Norm = [Norm, norm(grad_z(1))^2 + norm(grad_z(2))^2];
    zlist = [zlist, z];
    EGDA_Trajectory = [EGDA_Trajectory,[z(1); z(2); my_fun(z(1), z(2))]];
end
end

