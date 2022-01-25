clc; close all
clear
%% function plot f(x,y) = 1/4 for x<y-1; -0.25(x-y)^2-0.5(x-y) for y-1<=x<y; 0.25(x-y)^2-0.5(x-y) for y<=x<y+1; -1/4 for y+1<x.
[X, Y, Z] = my_fun_plot();
figure(1)
f = mesh(X,Y,Z);
view(-21,22)
xl = xlabel('$x$'); yl = ylabel('$y$'); zl = zlabel('$f(x, y)$');
set(xl,'Interpreter','latex');set(yl,'Interpreter','latex');set(zl,'Interpreter','latex')
saveas(f, '.\fig_results\problem.fig');
%% Initial point and iterations
x0 = 0; y0 = 0; maxiter = 1000; addpath('algorithms')
%% GDA
[Norm, zlist, GDA_Trajectory] = GDA(x0, y0, maxiter);
% save data resluts
save(strcat('.\data_results',filesep,'GDA_gradient_Norm','.mat'),'Norm');
save(strcat('.\data_results',filesep,'GDA_zk','.mat'),'zlist');
save(strcat('.\data_results',filesep,'GDA_Trajectory','.mat'),'GDA_Trajectory');
% plot
step = 25;
figure(2)
plot(1:step:maxiter+1, Norm(1:step:end), 'r-*')
xlabel('iterations'); 
handle = ylabel('$\parallel\partial_x f \parallel^2 + \parallel-\partial_y f \parallel^2$');
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
plot(1:step:maxiter+1, Norm(1:step:end), 'g-s')
%%%%%%%%%%%%%%%%%%%% EAG-V %%%%%%%%%%%%%%%%%%%%
[Norm, zlist, EAG_V_Trajectory] = EAG_V(x0, y0, maxiter);
% save data resluts
save(strcat('.\data_results',filesep,'EAG_V_gradient_Norm','.mat'),'Norm');
save(strcat('.\data_results',filesep,'EAG_V_zk','.mat'),'zlist');
save(strcat('.\data_results',filesep,'EAG_V_Trajectory','.mat'),'EAG_V_Trajectory');
% plot
figure(2); hold on
plot(1:step:maxiter+1, Norm(1:step:end), 'm-v')
%% FEG
[Norm, zlist, FEG_Trajectory] = FEG(x0, y0, maxiter);
% save data resluts
save(strcat('.\data_results',filesep,'FEG_gradient_Norm','.mat'),'Norm');
save(strcat('.\data_results',filesep,'FEG_zk','.mat'),'zlist');
save(strcat('.\data_results',filesep,'FEG_Trajectory','.mat'),'FEG_Trajectory');
% plot
figure(2)
hold on
plot(1:step:maxiter+1, Norm(1:step:end), 'b-o')
hold off
%% EGDA
[Norm, zlist, EGDA_Trajectory] = EGDA(x0, y0, maxiter);
% save data resluts
save(strcat('.\data_results',filesep,'EGDA_gradient_Norm','.mat'),'Norm');
save(strcat('.\data_results',filesep,'EGDA_zk','.mat'),'zlist');
save(strcat('.\data_results',filesep,'EGDA_Trajectory','.mat'),'EGDA_Trajectory');
% plot
figure(2)
hold on
grad_plot = plot(1:step:maxiter+1, Norm(1:step:end), 'k-d');
legend('GDA', 'EAG-C', 'EAG-V', 'FEG', 'EGDA')
axis([0 maxiter+1,-inf,inf])
hold off
saveas(grad_plot, '.\fig_results\gradient_plot.fig');
%% Trajectory of all algorithms
figure(4)
h1 = contour(X, Y, Z, 200); hold on;
h2 = plot(GDA_Trajectory(1,:), GDA_Trajectory(2,:), 'r--', 'LineWidth', 1); hold on;
h3 = plot(EAG_C_Trajectory(1,:), EAG_C_Trajectory(2,:), 'g--', 'LineWidth', 1.2); hold on;
h4 = plot(EAG_V_Trajectory(1,:), EAG_V_Trajectory(2,:), 'm--', 'LineWidth', 1); hold on;
h5 = plot(FEG_Trajectory(1,1:11), FEG_Trajectory(2,1:11), 'b--', 'LineWidth', 1); hold on;
h6 = plot(EGDA_Trajectory(1,:), EGDA_Trajectory(2,:), 'k--', 'LineWidth', 1); hold on;
h7 = plot(x0, y0, 'bo', 'LineWidth', 1);

handlex = xlabel('$x$'); 
handley = ylabel('$y$');
set(handlex,'Interpreter','latex'); set(handley,'Interpreter','latex'); 
legend([h2 h3 h4 h5 h6 h7], 'GDA', 'EAG-C', 'EAG-V', 'FEG', 'EGDA', 'Initial point')
saveas(h7, '.\fig_results\Trajectory_plot.fig');