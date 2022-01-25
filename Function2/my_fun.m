function [f] = my_fun(x, y)
f = log(1 + exp(x)) + 3 * x * y - log(1 + exp(y));
end
