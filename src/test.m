h = 0.01;
H = 0.5;
L0 = [0.3 1 1 3];
N = 10;
B0 = 50;
r0 = 1;
lambda = 2;
epsilon = 1e-5;
n = 300;
a = 3;

f =@(x, L) R(x, h, H, L, N, B0, r0, lambda, epsilon, n);


f_min = @(x, L, a, b, c)(f(x, L) -a.*sin(b.*x)+c);
L_min =@(x)fminsearch(@(L, a, b, c)f_min(x, L, a, b, c), L0);

x = linspace(0, a, n);

   