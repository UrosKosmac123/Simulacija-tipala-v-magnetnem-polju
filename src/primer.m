% Testen primer, izriše dva grafa za različne parametre.

h = 0.01;
H = 0.5;
L = 0.2;
L2 = 0.5;
N = 10;
B0 = 50;
r0 = 1;
lambda = 2;
epsilon = 1e-5;
n = 1000;
a = 4;

%plotW(0, h, H, L, N, n)

pL = linspace(0.1, 1, 100);
   
%plotR(h, H, 0.1, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, H, 0.3, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, H, 0.4, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, H, 0.6, N, B0, r0, lambda, epsilon, n, a)    
%plotR(h, H, 0.7, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, H, 0.8, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, H, 0.9, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, H, 1, N, B0, r0, lambda, epsilon, n, a)
tic

plotR(h, H, L, N, B0, r0, lambda, epsilon, n, a, "blue")
plotR(h, H, L2, N, B0, r0, lambda, epsilon, n, a, "red")
toc

legend("L = 0.2", "L = 0.5")

% -------------------------------------------------

%plotR(h, 0.1, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, 0.2, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, 0.3, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, 0.4, L2, N, B0, r0, lambda, epsilon, n, a)    
%plotR(h, H, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, 0.6, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, 0.7, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, 0.8, L2, N, B0, r0, lambda, epsilon, n, a)


%plotR(h, 0.9, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, 1, L2, N, B0, r0, lambda, epsilon, n, a)

% --------------------------------------------------

%plotR(h, 0.1, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, 0.2, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, 0.3, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, 0.4, L2, N, B0, r0, lambda, epsilon, n, a)    
%plotR(h, H, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, 0.6, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, 0.7, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, 0.8, L2, N, B0, r0, lambda, epsilon, n, a)

%plotR(h, 0.9, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, 1, L2, N, B0, r0, lambda, epsilon, n, a)

% -------------------------------------------------

%plotR(h, H, L2, 5, B0, r0, lambda, epsilon, n, a)
%plotR(h, H, L2, 6, B0, r0, lambda, epsilon, n, a)
%plotR(h, H, L2, 7, B0, r0, lambda, epsilon, n, a)
%plotR(h, H, L2, 8, B0, r0, lambda, epsilon, n, a)    
%plotR(h, H, L2, 9, B0, r0, lambda, epsilon, n, a)
%plotR(h, H, L2, N, B0, r0, lambda, epsilon, n, a)
%plotR(h, H, L2, 11, B0, r0, lambda, epsilon, n, a)
%plotR(h, H, L2, 12, B0, r0, lambda, epsilon, n, a)

%plotR(h, H, L2, 13, B0, r0, lambda, epsilon, n, a)
%plotR(h, H, L2, 14, B0, r0, lambda, epsilon, n, a)



