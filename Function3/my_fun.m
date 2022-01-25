function [f] = my_fun(x, y)
if x < y - 1
    f = 0.25;
elseif x < y
    f = -0.25*(x - y)^2 - 0.5*(x - y);
elseif x < y + 1
    f = 0.25*(x - y)^2 - 0.5*(x - y);
else
    f = -0.25;
end      

end

