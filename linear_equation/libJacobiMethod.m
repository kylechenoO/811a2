% JacobiMethod
% Written By KYLE CHEN
% Email <kyle@hacking-linux.com>
% Version 20201126v1

% set the data format
format long;

% set vars
x1 = 0;
x2 = 0;
x3 = 0;
precision = 0.000000000001;

% call function
[x1, x2, x3] = JacobiMethod(x1, x2, x3, precision);
fprintf('The final value is: [x1=%.9f][x2=%.9f][x3=%.9f]\n', x1, x2, x3);

% function part
% the JacobiMethod function input(x, precision), return(y)
function [x1, x2, x3] = JacobiMethod(x1, x2, x3, precision)
    % set precision and get the initial x, y_before
    precision = precision;
    [x1_before, x2_before, x3_before] = fn(x1, x2, x3);
    
    % initial step and start loop
    step = 0;
    fprintf('[STEP%d][Initial][x1=%.9f][x2=%.9f][x3=%.9f]\n', step, x1_before, x2_before, x3_before);
    while true
        % get the next y
        x1 = x1_before;
        x2 = x2_before;
        x3 = x3_before;
        [x1, x2, x3] = fn(x1, x2, x3);
        
        % count step and debug prt
        step = step + 1;
        fprintf('[STEP%d][x1_gap=%.9f][x2_gap=%.9f][x3_gap=%.9f][x1=%.9f][x2=%.9f][x3=%.9f]\n' ...,
            ,step, abs(x1 - x1_before), abs(x2 - x2_before), abs(x3 - x3_before), x1, x2, x3);
        
        % check the precision if match break, else set y_before = y and continue
        if ((x1 == x1_before) && (x2 == x2_before) && (x3 == x3_before)) || ...,
                ((abs(x1 - x1_before) < precision) && (abs(x2 - x2_before) < precision) && (abs(x2 - x2_before) < precision))
            break;

        else
            x1_before = x1;
            x2_before = x2;
            x3_before = x3;
            continue;

        end
    end
end

% the fn function, input(x1_before, x2_before, x3_before), return(x1, x2, x)
function [x1, x2, x3] = fn(x1_before, x2_before, x3_before)
    x1 = -0.8 * x2_before - 0.1 * x3_before - 0.7;
    x2 = -0.4 * x1_before + 0.5 * x3_before + 0.2;
    x3 = - 0.5 * x1_before - 0.1 * x2_before + 0.15;
end
