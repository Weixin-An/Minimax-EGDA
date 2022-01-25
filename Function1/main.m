clc; close all
clear
%% function plot f(x,y) = x^2 + 3sin^2 x sin^2 y - 4y^2 - 10 sin^2 y
[X, Y, Z] = my_fun_plot();
figure(1)
mesh(X,Y,Z)
view(-21,22)
xl = xlabel('$x$'); yl = ylabel('$y$'); zl = zlabel('$f(x, y)$');
set(xl,'Interpreter','latex');set(yl,'Interpreter','latex');set(zl,'Interpreter','latex')
hold on
% saddle point plot
saddle = [0; 0];
f = plot3(saddle(1), saddle(2), my_fun(saddle(1), saddle(2)), 'r*', 'LineWidth', 2);
text(saddle(1),saddle(2),my_fun(saddle(1), saddle(2))+20, char('saddle point'));
saveas(f, '.\fig_results\problem.fig');
%% Initial point and iterations
x0 = 5; y0 = 5; maxiter = 1000;
addpath('algorithms')
%% GDA
[Norm, zlist, GDA_Trajectory] = GDA(x0, y0, maxiter);
% save data resluts
save(strcat('.\data_results',filesep,'GDA_gradient_Norm','.mat'),'Norm');
save(strcat('.\data_results',filesep,'GDA_zk','.mat'),'zlist');
save(strcat('.\data_results',filesep,'GDA_Trajectory','.mat'),'GDA_Trajectory');
% plot
step = 25;
figure(2)
semilogy(1:step:maxiter+1, Norm(1:step:end), 'r-*')
xlabel('iterations'); 
handle = ylabel('$\parallel\partial_x f \parallel^2 + \parallel-\partial_y f \parallel^2$');
set(handle,'Interpreter','latex')
figure(3)
semilogy(1:step:maxiter+1, (zlist(1,1:step:end) - saddle(1)).^2 + (zlist(2,1:step:end) - saddle(2)).^2, 'r-*')
xlabel('iterations'); 
handle = ylabel('$\parallel x_t - x^* \parallel^2 + \parallel y_t - y^* \parallel^2$');
set(handle,'Interpreter','latex')
%% EAG
%%%%%%%%%%%%%%%%%%%% EAG-C %%%%%%%%%%%%%%%%%%%%
[Norm, zlist, EAG_C_Trajectory] = EAG_C(x0, y0, maxiter);
% save data resluts
save(strcat('.\data_results',filesep,'EAG_C_gradient_Norm','.mat'),'Norm');
save(strcat('.\data_results',filesep,'EAG_C_zk','.mat'),'zlist');
save(strcat('.\data_results',filesep,'EAG_C_Trajectory','.mat'),'EAG_C_Trajectory');
% plot
figure(2); hold on
semilogy(1:step:maxiter+1, Norm(1:step:end), 'g-s')
figure(3); hold on
semilogy(1:step:maxiter+1, (zlist(1,1:step:end) - saddle(1)).^2 + (zlist(2,1:step:end) - saddle(2)).^2, 'g-s')
%%%%%%%%%%%%%%%%%%%% EAG-V %%%%%%%%%%%%%%%%%%%%
[Norm, zlist, EAG_V_Trajectory] = EAG_V(x0, y0, maxiter);
% save data resluts
save(strcat('.\data_results',filesep,'EAG_V_gradient_Norm','.mat'),'Norm');
save(strcat('.\data_results',filesep,'EAG_V_zk','.mat'),'zlist');
save(strcat('.\data_results',filesep,'EAG_V_Trajectory','.mat'),'EAG_V_Trajectory');
% plot
figure(2); hold on
semilogy(1:step:maxiter+1, Norm(1:step:end), 'm-v')
figure(3); hold on
semilogy(1:step:maxiter+1, (zlist(1,1:step:end) - saddle(1)).^2 + (zlist(2,1:step:end) - saddle(2)).^2, 'm-v')
%% FEG
[Norm, zlist, FEG_Trajectory] = FEG(x0, y0, maxiter);
% save data resluts
save(strcat('.\data_results',filesep,'FEG_gradient_Norm','.mat'),'Norm');
save(strcat('.\data_results',filesep,'FEG_zk','.mat'),'zlist');
save(strcat('.\data_results',filesep,'FEG_Trajectory','.mat'),'FEG_Trajectory');
% plot
figure(2)
hold on
semilogy(1:step:maxiter+1, Norm(1:step:end), 'b-o')
hold off
figure(3)
hold on
semilogy(1:step:maxiter+1, (zlist(1,1:step:end) - saddle(1)).^2 + (zlist(2,1:step:end) - saddle(2)).^2, 'b-o')
hold off
%% EGDA
clear zlist
[Norm, zlist, EGDA_Trajectory] = EGDA(x0, y0, maxiter);
% save data resluts
save(strcat('.\data_results',filesep,'EGDA_gradient_Norm','.mat'),'Norm');
save(strcat('.\data_results',filesep,'EGDA_zk','.mat'),'zlist');
save(strcat('.\data_results',filesep,'EGDA_Trajectory','.mat'),'EGDA_Trajectory');
% plot
figure(2)
hold on
grad_plot = semilogy(1:step:maxiter+1, Norm(1:step:end), 'k-d');
legend('GDA', 'EAG-C', 'EAG-V', 'FEG', 'EGDA')
axis([0 maxiter+1,-inf,inf])
hold off
saveas(grad_plot, '.\fig_results\gradient_plot.fig');
figure(3)
hold on
zk_plot = semilogy(1:step:maxiter+1, (zlist(1,1:step:end) - saddle(1)).^2 + (zlist(2,1:step:end) - saddle(2)).^2, 'k-d');
legend('GDA', 'EAG-C', 'EAG-V', 'FEG', 'EGDA')
axis([0 maxiter+1,-inf,inf])
hold off
saveas(zk_plot, '.\fig_results\zk_plot.fig');
%% Trajectory of all algorithms
figure(4)
h1 = contour(X, Y, Z, 200); hold on;
h2 = plot(GDA_Trajectory(1,:), GDA_Trajectory(2,:), 'r--', 'LineWidth', 1); hold on;
h3 = plot(EAG_C_Trajectory(1,:), EAG_C_Trajectory(2,:), 'g--', 'LineWidth', 1.2); hold on;
h4 = plot(EAG_V_Trajectory(1,:), EAG_V_Trajectory(2,:), 'm--', 'LineWidth', 1); hold on;
h5 = plot(FEG_Trajectory(1,:), FEG_Trajectory(2,:), 'b--', 'LineWidth', 1); hold on;
h6 = plot(EGDA_Trajectory(1,:), EGDA_Trajectory(2,:), 'k--', 'LineWidth', 1); hold on;
h7 = plot(saddle(1), saddle(2), 'r*', 'LineWidth', 1);
h8 = plot(x0, y0, 'bo', 'LineWidth', 1);

handlex = xlabel('$x$'); 
handley = ylabel('$y$');
set(handlex,'Interpreter','latex'); set(handley,'Interpreter','latex'); 
legend([h2 h3 h4 h5 h6 h7 h8], 'GDA', 'EAG-C', 'EAG-V', 'FEG', 'EGDA', 'saddle point', 'Initial point')
saveas(h8, '.\fig_results\Trajectory_plot.fig');