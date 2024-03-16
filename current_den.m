function [vline_seg, hline_seg_lower, hline_seg_upper, X] = current_den(x0, h, H, L, N, k)
    
    
    k1 = floor((N*H/(N*H + L))*k);
    k2 = floor((L/(N*H + L))*k);
    
    v = linspace(h, H + h, k1);
    vline_seg = zeros(length(v), N);
    x = L/(N-1);
    X = zeros(N, 1);
    
    for i=1:N
        vline_seg(:,i) = v;
        X(i) = x*(i-1) + x0;
    end
    
    
    ho = linspace(x0, x + x0, k2); %(dodal x_0)
    hline_seg_lower = zeros(length(ho), floor(N/2));
    
    for i=1:floor(N/2)
        hline_seg_lower(:,i) = ho + (2*i-2)*x;
    end
      
    if mod(N,2) == 0
        hline_seg_upper = hline_seg_lower(:,1:(end-1)) + x;
    elseif mod(N,2) == 1
        hline_seg_upper = hline_seg_lower(:,1:end) + x;
    end
    
    