function [cosphi_v, cosphi_l, cosphi_u] = angles2(x0, h, H, L, N, B0, lambda, epsilon, k)
    
    [v, h_l, h_u, X] = current_den(x0, h, H, L, N, k);
   
    x = L/(N-1);
    
    cosphi_v = zeros(length(v), N);
    cosphi_l = zeros(length(h_l), floor(N/2));
    cosphi_u = zeros(length(h_u), floor(N/2)-1);
    
    for j=1:N
        cosphi = angleBj(X(j), v(1,j), B0, lambda, epsilon, 2, [0 current_sgn(j)]);
        cosphi_v(:,j) = cosphi.*ones(length(v), 1);
    end
    
    v1 = zeros(length(h_l), 1);
    
    for i=1:length(h_l)
        v1(i) = angleBj(h_l(i), h, B0, lambda, epsilon, 2, [1 0]);
        cosphi_l = repmat(v1, 1, floor(N/2));
    end
    
    v2 = zeros(length(h_u), 1);
   
    for i=1:length(h_u)
        v2(i) = angleBj(h_u(i), h, B0, lambda, epsilon, 2, [1 0]);
        cosphi_u = repmat(v2, 1, floor(N/2)-1);
    end
        
end