clc, clearvars, close all

%% Parameters
tf = 1000;          % Computation time-steps
N = 30;             % Dimension

K = -1; 
JA = -3; 
JR = -0.5;

%% Model Computation
[x, y, th, T] = swOCDT(JA, JR, K, N, tf);

%% Lyap Spectrum
% Jacobian
J = Jswarma(x, y, th, JA, JR, K, N);

% Exponents
%GenLambs = lyapuGen(J, T);
SpatLambs = lyapuGen(J(1:2*N, 1:2*N , :), T); % Spatial only

h = figure;
plot(SpatLambs)

%% Movie
% close all
% movs3D(x, y, th, 150)
