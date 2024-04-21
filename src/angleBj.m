function cosphi = angleBj(x,y, B0, lambda, epsilon, k, j)
    
    % Izračuna kota med vektorjem magnetnega polja B(x,y) pri parametrih B0 in lambda
    % ter koraku k in vektorjem tokovne gostote j
    
    [B1, B2] = B(x, y, B0, lambda, epsilon, k);
 
    cosphi = dot([B1 B2], j)./(norm([B1 B2])*norm(j));
    
end