%L0325026_Hanung Yoga Adi Pramono
function [x, iter, waktu] = IterasiGaussSeidel(A, b, tol, max_iter)
tic;
if nargin < 4
    A = [5 -1 -1 0 0; -1 5 -1 -1 0; -1 -1 4 -1 -1; 0 0 1 4 -2; 0 1 -1 1 4];
    b = [-1; 2; 6; 2; -1];
    tol = 0.001;
    max_iter = 2;
end
b = b(:);
[n, m] = size(A);

for i = 1 : n
    if (i == 1)
        x(i) = b(i) / A(i, i);
    else
        x(i) = 0;
    end
end
x = x';

C = -A;
for i = 1 : n
    C(i, i) = 0;
    C(i, :) = C(i, :) / A(i, i);
    d(i, 1) = b(i) / A(i, i);
end
i = 1;
konv = false;
while (i <= max_iter)
    xlama = x;
    for j = 1 : n
        x(j) = C(j, :) * x + d(j);
    end
    if (abs(xlama - x) <= tol)
        konv = true;
        break;
    end
    i = i + 1;
end
iter = min(i, max_iter);
waktu = toc;
if konv
    disp('Gauss Seidel method konverge');
else
    disp('Gauss Seidel method not konverge');
end
end
