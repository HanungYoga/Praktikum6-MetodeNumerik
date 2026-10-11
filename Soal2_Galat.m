%L0325026_Hanung Yoga Adi Pramono
clc; clear;
A = [5 -1 -1 0 0; -1 5 -1 -1 0; -1 -1 4 -1 -1; 0 0 1 4 -2; 0 1 -1 1 4];
b = [-1; 2; 6; 2; -1];
tol = 0.001;
max_iter = 2;

xe = EliminasiGauss(A, b);
x4 = Jacobi(A, b, tol, max_iter);
x5 = IterasiGaussSeidel(A, b, tol, max_iter);

galat_Jacobi = abs(xe - x4)
galat_GaussSeidel = abs(xe - x5)
