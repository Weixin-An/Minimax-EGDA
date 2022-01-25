function [Norm, zlist, FEG_Trajectory] = FEG(x0, y0, maxiter)
% initial point
x = x0; y = y0;
z = [x; y]; z0 = z; 
% cumulative variables
zlist = z; 
grad_z = my_grad(z);
Norm = norm(grad_z(1))^2 + norm(grad_z(2))^2; 
FEG_Trajectory = [z(1); z(2); my_fun(z(1), z(2))];
% parameters
tao = 0.5; eta = 2; delta = 0.3;
% find the smallest nonnegative integer i_0
i0 = 1;
tao_hat = tao * (1 - delta)^i0;
z_hat = z - tao_hat * my_grad(z);
while tao_hat * norm(my_grad(z_hat) - my_grad(z)) > norm(z_hat - z)
    i0 = i0 + 1;
    tao_hat = tao * (1 - delta)^i0;
    z_hat = z - tao_hat * my_grad(z);
end
tao = tao * (1 - delta)^i0;
z = z - tao * my_grad(z);
% main loop
for k = 1:maxiter
    ik = 0; jk = 0; searching = true;
    while searching == true
        searching = false;
        tao = tao * (1 - delta)^ik; eta = eta * (1 - delta)^jk;
        zk = z;
        z12 = z + 1/(k+1) * (z0 - z) - (1-1/(k+1)) * eta * my_grad(z);
        z = z + 1/(k+1) * (z0 - z) - tao * my_grad(z12) - (1-1/(k+1))*(eta-tao)*my_grad(z);
        if norm(my_grad(z) - my_grad(z12)) > 1 /tao * norm(z - z12)
            ik = ik + 1; searching = true;
        end
        if (my_grad(z) - my_grad(zk))' * (z - zk) < (eta - tao) /2 * norm(my_grad(z) - my_grad(zk))^2
            jk = jk + 1; searching = true;
        end
    end
    grad_z = my_grad(z);
    Norm = [Norm, norm(grad_z(1))^2 + norm(grad_z(2))^2];
    zlist = [zlist, z];
    FEG_Trajectory = [FEG_Trajectory,[z(1); z(2); my_fun(z(1), z(2))]];
end
end

