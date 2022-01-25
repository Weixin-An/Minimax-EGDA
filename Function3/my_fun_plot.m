function [X, Y, Z] = my_fun_plot()
x = -6:0.01:6;
y = -6:0.01:6;
[X, Y] = meshgrid(x,y);
for i = 1:length(x)
    for j = 1:length(y)
        Z(i,j) = my_fun(X(i,j), Y(i,j)); 
    end
end
end

