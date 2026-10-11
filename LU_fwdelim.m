%L0325026_Hanung Yoga Adi Pramono
function [L, U, b] = LU_fwdelim(A, b)
if nargin < 2
    A = [5 -1 -1 0 0; -1 5 -1 -1 0; -1 -1 4 -1 -1; 0 0 1 4 -2; 0 1 -1 1 4];
    b = [-1; 2; 6; 2; -1];
end
b = b(:);
[n, l] = size(A);
L = zeros(n);
for i = 1 : n-1
    for h = i+1 : n
        m = A(h, i) / A(i, i);
        L(h, i) = m;
        A(h, :) = A(h, :) - m * A(i, :);
    end
end
L = L + eye(n);
U = A;
end
