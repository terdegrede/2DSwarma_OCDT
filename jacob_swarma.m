function Jtemp = jacob_swarma(xx, yy, tth, JA,  JR, K, N)
% Implementation of the Jacobian 
% 


% Model parameters
Jp = (JA + JR)/2;
Jn = (JA - JR)/2;
Kn = K/2;

%% Element-wise operations

% Differences
% raa = [a(1)-a(1)  a(2)-a(1)   a(3)-a(1)   ...;
%       a(1)-a(2)   a(2)-a(2)   a(3)-a(2)   ...;
%       .
%       .
%       .
%       a(1)-a(N)   a(2)-a(N)       ...     a(N)-a(N)];

rxx = xx' - xx;
ryy = yy' - yy;
rtt = tth' - tth;

% Element-wise cosines
crxx = cos(rxx);        c2rxx = cos(2*rxx);
cryy = cos(ryy);        c2ryy = cos(2*ryy);
crtt = cos(rtt);

% Element-wise sines
srxx = sin(rxx);        s2rxx = sin(2*rxx);
sryy = sin(ryy);        s2ryy = sin(2*ryy);
srtt = sin(rtt);

%% Jacobian Blocks
% J = [J1 J2 J3;
%       J4 J5 J6;
%       J7 J8 J9];

% J1 ----------------------------------------------------------------------
J1nd = 1/N*(Jn*crtt.*crxx - Jp*srxx.*srtt);
J1nd = J1nd - diag(diag(J1nd));   % Clearing diagonal

% diagonal
XX = 1/N*(Jp*srtt.*srxx - Jn*crtt.*crxx);
XX = XX - diag(diag(XX));
J1d = diag(sum(XX, 2));

% Full
J1 = J1d + J1nd;

% J2 ----------------------------------------------------------------------
J2 = zeros(N, N);

% J3 ----------------------------------------------------------------------
J3nd = 1/N*(-Jn*srtt.*srxx - Jp*crtt.*(1 - crxx));

% diagonal
XT = 1/N*(Jn*srxx.*srtt + Jp*crtt.*(1 - crxx));
J3d = diag(sum(XT, 2));

% Full
J3 = J3d + J3nd;

% J4 ----------------------------------------------------------------------
J4 = zeros(N, N);

% J5 ----------------------------------------------------------------------
J5nd = 1/N*(Jn*crtt.*cryy - Jp*srtt.*sryy);
J5nd = J5nd - diag(diag(J5nd));   % Clearing diagonal

% diagonal
YY = 1/N*(Jp*srtt.*sryy - Jn*crtt.*cryy);
YY = YY - diag(diag(YY));
J5d = diag(sum(YY, 2));

% Full
J5 = J5d + J5nd;

% J6 ----------------------------------------------------------------------
J6nd = 1/N*(-Jn*sryy.*srtt - Jp*crtt.*(1 - cryy));

% diagonal
YT = 1/N*(Jn*sryy.*srtt + Jp*crtt.*(1 - cryy));
J6d = diag(sum(YT, 2));

% Full
J6 = J6d + J6nd;

% J7 ----------------------------------------------------------------------
J7nd = Kn/N*(-2*srtt.*s2rxx);

% diagonal
TX = 2*Kn/N*(srtt.*s2rxx);
J7d = diag(sum(TX, 2));

% Full
J7 = J7d + J7nd;

% J8 ----------------------------------------------------------------------
J8nd = Kn/N*(-2*srtt.*s2ryy);

% diagonal
TY = 2*Kn/N*(srtt.*s2ryy);
J8d = diag(sum(TY, 2));

% Full
J8 = J8d + J8nd;

% J9 ----------------------------------------------------------------------
J9nd = Kn/N*crtt.*(2 + c2rxx + c2ryy);
J9nd = J9nd - diag(diag(J9nd));   % Clearing diagonal

% diagonal
TT = Kn/N*(-crtt.*(2 + c2rxx + c2ryy));
TT = TT - diag(diag(TT));   % Clearing diagonal

J9d = diag(sum(TT, 2));

% Full
J9 = J9d + J9nd;

%% Jacobian
Jtemp = [J1 J2 J3;
    J4 J5 J6;
    J7 J8 J9];

end