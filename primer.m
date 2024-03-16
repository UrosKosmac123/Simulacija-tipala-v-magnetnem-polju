% R(x0, h, H, L, N, B0, r0, lambda, epsilon, k)

h = [0.01 0.01];
H = [0.5 0.5];
L = [0.2 0.5];
N = [10 10];
B0 = 50;
r0 = 1;
lambda = 2;
epsilon = 1e-5;
k = 1000;
a = 4;

plotR(h, H, L, N, B0, r0, lambda, epsilon, k, a)