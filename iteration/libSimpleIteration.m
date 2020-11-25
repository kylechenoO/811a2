% SimpleIteration
% Written By KYLE CHEN
% Email <kyle@hacking-linux.com>
% Version 20201125v1

% set the data format
format long;

% set vars
x = 0.35;
precision = 0.000000001;

% call function
result = SimpleIteration(x, precision);
fprintf('The final value is: %.9f\n', result);

% function part
% the SimpleIteration function input(x, precision), return(y)
function y = SimpleIteration(x, precision)
    % set precision and get the initial x, y_before
    precision = precision;
    x = x;
    y_before = fn(x);
    
    % initial step and start loop
    step = 0;
    while true
        % get the next y
        x = y_before;
        y = fn(x);
        
        % count step and debug prt
        step = step + 1;
        fprintf('[STEP%d][gap=%.9f][x=%.9f][y=%.9f]\n', step, abs(y - y_before), x, y);
        
        % check the precision if match break, else set y_before = y and continue
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
    y = 0.25 * exp(x);
end
