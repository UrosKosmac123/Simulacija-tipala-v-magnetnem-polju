function test()

% Define your function R(x; h, H, L, N)
function R = my_function(x, h, H, L, N)
    % Define your function R(x) here
    R = R(x, h, H, L, N, 50, 1, 2, 1e-4, 500)
end

% Define the cost function
function cost = cost_function(params, x_data, y_data)
    h = params(1);
    H = params(2);
    L = params(3);
    N = params(4);
    
    R_model = my_function(x_data, h, H, L, N);
    cost = sum((R_model - y_data).^2); % sum of squared differences
end

    % Generate some example data
    x_data = linspace(0, 10, 100);
    y_data = 0.5.*sin(x_data) + 5; % Example sine wave data
    
    % Initial guess for parameters [h, H, L, N]
    initial_guess = [0, 1, 10, 1];
    
    % Optimize parameters using fminsearch
    params = fminsearch(@(params) cost_function(params, x_data, y_data), initial_guess);
    
    % Extract optimized parameters
    h_optimized = params(1);
    H_optimized = params(2);
    L_optimized = params(3);
    N_optimized = params(4);
    
    % Generate R(x) using optimized parameters
    R_optimized = my_function(x_data, h_optimized, H_optimized, L_optimized, N_optimized);
    
    % Plot original sine wave and optimized R(x)
    plot(x_data, y_data, 'b', x_data, R_optimized, 'r');
    legend('Sine Wave', 'Optimized R(x)');
end