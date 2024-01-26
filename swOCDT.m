function [X, Y, Th, t] = swOCDT(JA, JR, K, N, tf)
% Computation of the model using ode45

tspan = 0:0.1:tf; % time-span

% Initial conditions
[x0, y0, th0] = ic2_fn(-pi, pi, -pi, pi, -pi, pi, N);
r0 = [x0; y0; th0];

% Computation
[t, r] = ode45(@(t,r) swarmafun(t, r, N, K, JA, JR), tspan, r0);

% Rearranging data
X = r(:, 1:N)';
Y = r(:, N + 1: 2*N)';
Th = r(:, 2*N + 1: 3*N)';


    function drdt = swarmafun(t, r, N, K, JA, JR)

        KK = K/2;
        Jp = (JA + JR)/2;
        Jn = (JA - JR)/2;


        drdt = zeros(N, 1); % Allocation

        % Conditioning variables
        rx = r(1: N);
        ry = r(N + 1: 2*N);
        rt = r(2*N + 1: 3*N);


        Rxx = rx' - rx;
        Ryy = ry' - ry;
        Rtt = rt' - rt;


        % Dynamics
        drdt(1: N) = 1/N*sum( Jn*sin(Rxx).*cos(Rtt) -...
            Jp*(1 - cos(Rxx)).*sin(Rtt), 2); % dxdt

        drdt(N + 1: 2*N) = 1/N*sum( Jn*sin(Ryy).*cos(Rtt) -...
            Jp*(1 - cos(Ryy)).*sin(Rtt), 2); % dydt

        drdt(2*N + 1: 3*N) = KK/N*sum( sin(Rtt).*...
            (2 + cos(2*Rxx) + cos(2*Ryy)) ,2); % dthdt

%         drdt(1: N) = 1/2/N*sum(JA*(sin(Rxx).*cos(Rtt) -...
%             (1 - cos(Rxx)).*sin(Rtt)) - ...
%             JR*(sin(Rxx).*cos(Rtt) +...
%             (1 - cos(Rxx)).*sin(Rtt)), 2); % dxdt
% 
%         drdt(N + 1: 2*N) = 1/2/N*sum(JA*(sin(Ryy).*cos(Rtt) -...
%             (1 - cos(Ryy)).*sin(Rtt)) - ...
%             JR*(sin(Ryy).*cos(Rtt) +...
%             (1 - cos(Ryy)).*sin(Rtt)), 2); % dydt
% 
%         drdt(2*N + 1: 3*N) = K/N*sum( sin(Rtt).*...
%             (1 + 0.5*cos(2*Rxx) + 0.5*cos(2*Ryy)) ,2); % dthdt


    end




















end