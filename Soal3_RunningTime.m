%L0325026_Hanung Yoga Adi Pramono
clc; clear;
A = [5 -1 -1 0 0; -1 5 -1 -1 0; -1 -1 4 -1 -1; 0 0 1 4 -2; 0 1 -1 1 4];
b = [-1; 2; 6; 2; -1];
tol = 0.001;
max_iter = 2;

[~, ~, ~, t1] = EliminasiGauss(A, b);
[~, ~, ~, t2] = EliminasiGaussJordan(A, b);
[~, ~, ~, ~, t3] = LU_Solusi(A, b);
[~, ~, t4] = Jacobi(A, b, tol, max_iter);
[~, ~, t5] = IterasiGaussSeidel(A, b, tol, max_iter);
satu_kali = [t1 t2 t3 t4 t5]

N = 1000;
T = zeros(N, 5);
for k = 1 : N
    [~, ~, ~, T(k,1)] = EliminasiGauss(A, b);
    [~, ~, ~, T(k,2)] = EliminasiGaussJordan(A, b);
    [~, ~, ~, ~, T(k,3)] = LU_Solusi(A, b);
    evalc('[~, ~, T(k,4)] = Jacobi(A, b, tol, max_iter);');
    evalc('[~, ~, T(k,5)] = IterasiGaussSeidel(A, b, tol, max_iter);');
end
rata_rata = mean(T)
