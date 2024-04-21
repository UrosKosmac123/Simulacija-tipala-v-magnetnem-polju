format long

h = 0.01;
H = 0.5;
L = 0.2;
L2 = 0.5;
N = 10;
B0 = 50;
r0 = 1;
lambda = 2;
epsilon = 1e-7;
n = 29;

f =@(y) exp(-2*pi.*y./lambda);
h_app =@(y, n) abs(f(y) - (f(y)).^n);

int = linspace(h, h + H);

max_y = fminbnd(@(y)-h_app(y, n), h, H+h);
h_app(max_y, n)

for i = 1:((n-1)/2)
    hold on
    plot(int, h_app(int, 2*i + 1))
end

avg = (1./H).*integral(@(y) h_app(y, n), h, h+H) 