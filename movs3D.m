function movs3D(x, y, th, stp)
% This function generates  a figure with to panels:
%           Top: 2D position of the particles. Colors are phases.
%           Bottom: 3D positions of the particles in the x-y-theta space.
%
% Inputs:
%           - States of each particle in x, y, and theta.
%           - Step size "stp".
% 
% Example:
%
% clc, clearvars, close all
%
% tf = 500; N  = 20;
%
% K = -1; 
% J1 = -0.5; 
% J2 = -0.5;
% 
% [x, y, th, T] = swOHDT(J1, J2, K, N, tf);
% 
% % Movie
% movs3D(x, y, th, 10)
%

f = figure;
f.Position = [100 100 450 900];

for n = 1:stp: length(x)

    subplot(211) 
    scatter(wrapToPi(x(:, n)), wrapToPi(y(:, n)), [], ...
    hsv2rgb([wrapTo2Pi(th(:,n))/2/pi ones(size(th, 1), 1)...
    ones(size(th, 1), 1)]),...
    'filled')
    
    axis square
    axis([-pi-0.4 pi+0.4 -pi-0.4 pi+0.4])
    xlabel('x'), ylabel('y')
    xticks([-pi 0 pi])
    xticklabels({'-\pi', '0', '\pi'})
    yticks([-pi 0 pi])
    yticklabels({'-\pi', '0', '\pi'})
    set(gca, 'FontSize', 14)
    text(0,-pi , [num2str(n), ' out of ', num2str(length(x))])
    drawnow 

    subplot(212)
    scatter3(wrapToPi(x(:, n)), wrapToPi(y(:, n)), wrapToPi(th(:, n)), '.')
    
    axis square
    axis([-pi-0.4 pi+0.4 -pi-0.4 pi+0.4 -pi-0.4 pi+0.4])
    xlabel('x'), ylabel('y'), zlabel('\theta')
    xticks([-pi 0 pi])
    xticklabels({'-\pi', '0', '\pi'})
    yticks([-pi 0 pi])
    yticklabels({'-\pi', '0', '\pi'})
    zticks([-pi 0 pi])
    zticklabels({'-\pi', '0', '\pi'})
    set(gca, 'FontSize', 14)
    view(-28, 17)

end





end