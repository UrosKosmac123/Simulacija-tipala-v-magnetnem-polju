function [vline_seg, hline_seg_lower, hline_seg_upper, X] = current_den(x0, h, H, L, N, n)
    
    % Za žico z danimi podatki, funkcija razdeli žico na točke oz. na manjše delčke 		dolžine 
    % ∆l << 1.
    
    % x0 - horizontalni začetek žice.
    % h - dvig nad x-osjo.
    % H - vertikalna dolžina žice.
    % L - horizontalna dolžina žice. 
    % N - št. prepogibanj.
    % n - št. točk s katerimi aproksimiramo žico.
    
    
    
    k1 = floor((N*H/(N*H + L))*n);   % relativen delež točk na vertikalnih dolžinah
    k2 = floor((L/(N*H + L))*n);     % relativen delež točk na horizontalnih dolžinah
   
    
    v = linspace(h, H + h, k1);     % vrednosti med h in H+h
    vline_seg = zeros(length(v), N);
    
    x = L/(N-1);    % dolžina horizontalnega delčka
    X = zeros(N, 1);     % seznam x vrednosti vertikalnih segmentov
    
    for i=1:N
        vline_seg(:,i) = v;
        X(i) = x*(i-1) + x0;
    end
    
    
    ho = linspace(x0, x + x0, k2);     % vrednosti med x0 in x + x0 
    hline_seg_lower = zeros(length(ho), floor(N/2));
    
    for i=1:floor(N/2)
        hline_seg_lower(:,i) = ho + (2*i-2)*x;
    end
      
    if mod(N,2) == 0
        hline_seg_upper = hline_seg_lower(:,1:(end-1)) + x;
    elseif mod(N,2) == 1
        hline_seg_upper = hline_seg_lower(:,1:end) + x;
    end
    
    