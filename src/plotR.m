function plotR(h, H, L, N, B0, r0, lambda, epsilon, n, a, c)
    
    % Izriše graf upornosti v odvisnosti od premika x, kjer x ∈ (-a, a)
    
    % x0 - horizontalni začetek žice.
    % h - dvig nad x-osjo.
    % H - vertikalna dolžina žice.
    % L - horizontalna dolžina žice. 
    % N - št. prepogibanj.
    % B0 - osnovna jakost magnetnega polja
    % lamda - parameter.
    % epsilon - natančnost polja.
    % n - št. točk s katerimi aproksimiramo žico.
    
    x = linspace(-a,a,n);
    f1 =@(x) R(x, h, H, L, N, B0, r0, lambda, epsilon, n);

    
    y1 = zeros(n, 1);
    for i=1:n
        y1(i) = f1(x(i));
    end

    hold on
       scatter(x, y1, c)
    hold off
    
end
