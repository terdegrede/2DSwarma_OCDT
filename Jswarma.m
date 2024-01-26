function J = Jswarma(x, y, th, JA, JR, K, N)
% Thi function allows the use of parfor to compute the Jacobian of the
% swarmalators for specific x,y,theta data.

% Allocation
J = zeros(3*N, 3*N, length(x));

parfor n = 1: length(x)
    J(:, :, n+1) = jacob_swarma(x(:, n), y(:, n), th(:, n),  JA,  JR, K, N);
end

end