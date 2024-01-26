function lambs = lyapuGen(J, t)
% This function calculates the lyapunov spectrum from the Jacobian data.
% Inputs:
%           J : Jacobian data [size 3N x length(t)]
%           t : time vector


N = size(J, 1); % Dimension
M = N; 

% Variational dynamics
Y0 = GS(rand(N,M)); % Initial conditions(M columns of N states)
[Y, dYdt] = pert_dyn(J, Y0, t); % Recursion

lambs = zeros(1, M);

parfor nn = 1:M

    Pn = reshape(Y(:, nn, :),[], length(t) + 1);
    dPndt = reshape(dYdt(:, nn, :),[], length(t) + 1);
    lambs(nn) = lyapExp(dPndt, Pn);
end
end





