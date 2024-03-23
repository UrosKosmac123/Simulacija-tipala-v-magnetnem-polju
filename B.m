function [B1, B2] = B(x,y, B0, lambda, epsilon, k)
    
    % v dani točki (x, y), pri parametrih B0 in lambda izračuna magnetno polje.
    % epsilon - natančnost rešitve
    % k - korak
    
    expf = exp(-pi.*y./lambda);
    f1 =@(n) cos(2.*pi.*n.*x/lambda)/n;
    f2 =@(n) sin(2.*pi.*n.*x/lambda)/n;
    
    B1 = B0*(-4/pi).*expf.*inf_sum(f1, epsilon, k);
    B2 = B0*(4/pi).*expf.*inf_sum(f2, epsilon, k);
       
   
end