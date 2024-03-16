function cosphi = angleBj(x,y, B0, lambda, epsilon, k, j)
    [B1, B2] = B(x, y, B0, lambda, epsilon, k);
 
    cosphi = dot([B1 B2], j)./(norm([B1 B2])*norm(j));
    
end