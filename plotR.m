function plotR(h, H, L, N, B0, r0, lambda, epsilon, k, a)
    
    x = linspace(-a,a,k);
    f1 =@(x) R(x, h(1), H(1), L(1), N(1), B0, r0, lambda, epsilon, k);

    
    y1 = zeros(k, 1);
    for i=1:k
        y1(i) = f1(x(i));
    end

    f2 =@(x) R(x, h(2), H(2), L(2), N(2), B0, r0, lambda, epsilon, k);

    y2 = zeros(k, 1);
    for i=1:k
        y2(i) = f2(x(i));
    end

    hold on
    plot(x, y1)
    plot(x, y2)
    hold off
    
end