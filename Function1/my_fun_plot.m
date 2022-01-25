function [X, Y, Z] = my_fun_plot()
x = -10:0.02:10;
y = -6:0.02:6;
[X, Y] = meshgrid(x,y);
for i = 1:length(y)
    for j = 1:length(x)
        Z(i,j) = my_fun(X(i,j), Y(i,j)); 
    end
end
end

