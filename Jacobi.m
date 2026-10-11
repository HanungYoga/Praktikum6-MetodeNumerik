%L0325026_Hanung Yoga Adi Pramono
function [x, iter, waktu] = Jacobi(A, b, tol, max_iter)
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
    xlama(i) = b(i) / A(i, i);
end
xlama = xlama';

C = -A;
for i = 1 : n
    C(i, i) = 0.0;
    C(i, :) = C(i, :) / A(i, i);
    d(i, 1) = xlama(i);
end
i = 1;
konv = false;
while (i <= max_iter)
    xbaru = C * xlama + d;
    if (abs(xbaru - xlama) <= tol)
        konv = true;
        break;
    else
        xlama = xbaru;
    end
    i = i + 1;
end
x = xbaru;
iter = min(i, max_iter);
waktu = toc;
if konv
    disp('Jacobi method konverge');
else
    disp('Jacobi method not konverge');
end
end
