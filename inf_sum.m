function S = inf_sum(f, epsilon, k)
    S = f(1);
    n = 1;
    while abs(f(n)) >= epsilon
        S = S + f(n+k);
        n = n + k;
    end
end