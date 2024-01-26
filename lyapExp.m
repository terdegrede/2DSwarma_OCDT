function lambda = lyapExp(dP, P) 
% lambda = lyapExp(dP, P) 
%
% This function calculates the Lyapunov exponents using perturbation 
% dynamics data.
% 
%
% Output: 
%           lambda: Vector of lyapunov exponents
%


LL = length(dP);

% Allocation
vwdot = zeros(1, LL);
for k = 1: LL
    vwdot(k) = dP(:, k)'*P(:, k);
end

vwnorm = vecnorm(P).^2;
lambda = mean(vwdot./vwnorm);
end


% ## Tried to avoid the loop using arrays but ran out of memory.