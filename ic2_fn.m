function [x0, y0, th0] = ic2_fn(min_x, max_x, min_y, max_y,...
    min_th, max_th, N)
% [x0, y0, th0] = ic2_fn(min_x, max_x, min_y, max_y,min_th, max_th, N)
%
% This function generates N random values uniformly distributed 
% for two vectors between given boundaries.
% 
% Outputs:
%       x0 : Vector of random values between min_x(scalar) and max_x(scalar).
%       x0 : Vector of random values between min_y(scalar) and max_y(scalar).
%       th0 : Vector of random values between min_th(scalar) and max_th(scalar). 
%
% Example:
% clc, clearvars
%
% N = 500;
% min_x = -1;
% max_x = 1;
% min_y = -1;
% max_y = 1;
% min_th = -pi;
% max_th = pi;
%
% [x0, y0, th0] = ic2_fn(min_x, max_x, min_y, max_y, min_th, max_th, N);

x0 = (max_x - min_x).*rand(N,1) + min_x;
y0 = (max_y - min_y).*rand(N,1) + min_y;
th0 = (max_th - min_th).*rand(N,1) + min_th;
