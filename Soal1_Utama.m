%L0325026_Hanung Yoga Adi Pramono
clc; clear;
A = [5 -1 -1 0 0; -1 5 -1 -1 0; -1 -1 4 -1 -1; 0 0 1 4 -2; 0 1 -1 1 4];
b = [-1; 2; 6; 2; -1];
tol = 0.001;
max_iter = 2;

[x1, U1, c1, t1] = EliminasiGauss(A, b);
[x2, U2, c2, t2] = EliminasiGaussJordan(A, b);
[x3, z3, L3, U3, t3] = LU_Solusi(A, b);

[x4, iter4, t4] = Jacobi(A, b, tol, max_iter);
[x5, iter5, t5] = IterasiGaussSeidel(A, b, tol, max_iter);

hasil = [x1 x2 x3 x4 x5]
iterasi = [iter4 iter5]
