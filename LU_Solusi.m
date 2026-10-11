%L0325026_Hanung Yoga Adi Pramono
function [x, z, L, U, waktu] = LU_Solusi(A, b)
tic;
if nargin < 2
    A = [5 -1 -1 0 0; -1 5 -1 -1 0; -1 -1 4 -1 -1; 0 0 1 4 -2; 0 1 -1 1 4];
    b = [-1; 2; 6; 2; -1];
end
b = b(:);
[L, U, b] = LU_fwdelim(A, b);
[n, m] = size(L);
z = zeros(n, 1);
x = zeros(n, 1);
% forward substitution
z(1) = b(1) / L(1, 1);
for i = 2 : n
    z(i) = (b(i) - L(i, 1:i-1) * z(1:i-1)) / L(i, i);
end
% backward substitution
x(n) = z(n) / U(n, n);
for i = n-1 : -1 : 1
    x(i) = (z(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
end
waktu = toc;
end
