% NumericalMethod
% Written By KYLE CHEN
% Email <kyle@hacking-linux.com>
% Version 20201124v1

% set the data format
format long;

% set vars
x = 1
precision = 0.000000001

% call function
result = NumericalMethod(x, precision)
fprintf('The final value is: %.9f\n', result)

% function part
% the NumericalMethod function input(x, precision), return(y)
function y = NumericalMethod(x, precision)
    x = x;
    precision = precision;
    y_before = fn(x);
    while true
        x = y_before;
        y = fn(x);
        fprintf('The precision is: %.9f\n', abs(y - y_before));
        if abs(y - y_before) < precision
            break;

        else
            y_before = y;
            continue;

        end
    end
end

% the fn function, input(x), return(y)
function y = fn(x)
    y = 0.5 * (x + 2/x);
end
