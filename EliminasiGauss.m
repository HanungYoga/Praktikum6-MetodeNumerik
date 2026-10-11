%L0325026_Hanung Yoga Adi Pramono
function [x, A, b, waktu] = EliminasiGauss(A, b)
tic;
if nargin < 2
    A = [5 -1 -1 0 0; -1 5 -1 -1 0; -1 -1 4 -1 -1; 0 0 1 4 -2; 0 1 -1 1 4];
    b = [-1; 2; 6; 2; -1];
end
b = b(:);
[n, l] = size(A);
x = zeros(n, 1);

for i = 1 : n-1
    for h = i+1 : n
        m = A(h, i) / A(i, i);
        A(h, :) = A(h, :) - m * A(i, :);
        b(h, :) = b(h, :) - m * b(i, :);
    end
end

x(n, :) = b(n, :) / A(n, n);
for i = n-1 : -1 : 1
    x(i, :) = (b(i, :) - A(i, i+1:n) * x(i+1:n, :)) / A(i, i);
end
waktu = toc;
end
