function [cosphi_v, cosphi_l, cosphi_u] = angles(x0, h, H, L, N, B0, lambda, epsilon, n)
    
    % Izračun kotov med tokovno gostoto j in vektorjem magnetnega polja B(x,y)
    % kjer so točke (x,y) točke iz segmentov žice, dobljene iz funckije current_den.
    
    % x0 - horizontalni začetek žice.
    % h - dvig nad x-osjo.
    % H - vertikalna dolžina žice.
    % L - horizontalna dolžina žice. 
    % N - št. prepogibanj.
    % B0 - osnovna jakost magnetnega polja
    % lamda - parameter.
    % epsilon - natančnost polja.
    % n - št. točk s katerimi aproksimiramo žico.
    
    [v, h_l, h_u, X] = current_den(x0, h, H, L, N, n);
    
    x = L/(N-1);
    
    cosphi_v = zeros(length(v), N);
    cosphi_l = zeros(length(h_l), floor(N/2));
    cosphi_u = zeros(length(h_u), floor(N/2)-1);
    
    for j=1:N
        for i=1:length(v)
            cosphi = angleBj(X(j), v(i,j), B0, lambda, epsilon, 2, [0 current_sgn(j)]);
            cosphi_v(i,j) = cosphi;
       end
    end
    
    for j=1:(floor(N/2))
        for i=1:length(h_l)
            cosphi = angleBj(h_l(i), h, B0, lambda, epsilon, 2, [1 0]);
            cosphi_l(i,j) = cosphi;
        end
    end
    
    for j=1:(floor(N/2)-1)
        for i=1:length(h_u)
            cosphi = angleBj(h_u(i), h, B0, lambda, epsilon, 2, [1 0]);
            cosphi_u(i,j) = cosphi;
        end
    end
    
end