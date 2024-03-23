function S = inf_sum(f, epsilon, k)
    
    % Izračuna neskočno vsoto ∑f, z začetkom pri 1 in korakom k (tj. 1, 1+k, 1+2k, ...)
    % epsilon - natančnost
    
    S = f(1);
    n = 1;
    while abs(f(n)) >= epsilon
        S = S + f(n+k);
        n = n + k;
    end
end