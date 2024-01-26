function [Y, dYdt] = pert_dyn(J, Y0, t)
    % Perturbation dynamics dpdt = J*ps
    % "p" is the perturbation
    % "p0" is the initial perturbation
    % "J" is the Jacobian

% Time-step
dt = t(2)- t(1);

% Allocation
[S1, S2] = size(Y0); 
dYdt = zeros(S1, S2, length(t));
Y = zeros(S1, S2, length(t));

% Initial conditions
Y(:, :, 1) = Y0;

for k = 1: length(t)

    dYdt(:, :, k+1) = J(:, :, k)*Y(:,:, k);
    Y(:, :, k+1) = dYdt(:, :, k)*dt + Y(:,:, k);
    Y(:, :, k+1) = GS(Y(:, :, k+1)); 

end

end