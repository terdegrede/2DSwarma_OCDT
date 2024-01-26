function Q = GS(A)
% Q = GS(A)
% Generic implementation of the Gram-Schmidt algorithm. 
% (see https://web.mit.edu/18.06/www/Essays/gramschmidtmat.pdf)
%
% Input: 
%       A: Array of independent vectors
% Output:
%       Q: Array of orthonormal vectors 
%
% Example:
%
% clc, clearvars
% A = rand(3, 2);
%
% B = GS(A);
% 

% % Initialization
[m, n] = size(A);
% 
Q = zeros(m, n);
Q(:,1) = A(:,1)/norm(A(:,1));

% Algorithm
for k = 2:n
    Q(:, k) = A(:,k);
    for j = 1: k-1
        Q(:, k) = Q(:, k) - (Q(:, j)'*Q(:, k))*Q(:, j);
    end
    Q(:, k) = Q(:, k)/norm(Q(:, k));
end
end


