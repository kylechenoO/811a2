% BisectionMethod
% Written By KYLE CHEN
% Email <kyle@hacking-linux.com>
% Version 20201124v1

% set the data format
format long;

% set vars
xs = 1;
xl = 1.5;
precision = 0.00001;

% call function
[xs, xl] = BisectionMethod(xs, xl, precision);
fprintf('The final value is between : %.9f and %.9f\n', xs, xl);

% function part
% the BisectionMethod function input(xs, xl, precision), return(xs, xl)
function [xs, xl] = BisectionMethod(xs, xl, precision)
    % set precision and get initial ys && yl
    precision = precision;
    ys = fn(xs);
    yl = fn(xl);
    
    % check if the ys and yl is in ordered
    if ys > yl
        tmp = ys;
        ys = yl;
        yl = tmp;
        tmp = xs;
        xs = xl;
        xl = tmp;
    end
    
    % start loop
    step = 0;
    fprintf('[STEP%d][xs=%.9f][xl=%.9f][ys=%.9f][yl=%.9f]\n', step, xs, xl, ys, yl);
    while true
        % get the gap of xl and xs if match the precision break out the loop
        if abs(xl - xs) < precision
            break;
        end
        
        % get next x && y
        x = (xs + xl) / 2;
        y = fn(x);
        
        % count the step
        step = step + 1;
        
        % if the large number is smaller than before swap them
        if (y > 0) && (y < yl)
            xl = x;
            yl = y;
        end
        
        % if the smaller number is lager than before swap them
        if (y < 0) && (y > ys)
            xs = x;
            ys = y;
        end
        
        % debug prt
        fprintf('[STEP%d][xs=%.9f][xl=%.9f][ys=%.9f][yl=%.9f]\n', step, xs, xl, ys, yl);
    end
end

% the fn function, input(x), return(y)
function y = fn(x)
    y = x^3 - 0.75*x^2 - 4.5*x + 4.75;
end
