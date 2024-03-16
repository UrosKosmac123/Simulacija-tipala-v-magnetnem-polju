function plotW(x0, h, H, L, N, k)
    
    [vline_seg, hline_seg_lower, hline_seg_upper, X] = current_den(x0, h, H, L, N, k);
    
    x = L/(N-1);
    k1 = floor((N*H/(N*H + L))*k);
    k2 = floor((L/(N*H + L))*k);
    y_h = h.*ones(1, (floor(N/2)));
    
    if mod(N,2) == 0
        y_Hh = (H+h).*ones(1, (floor(N/2)-1));
    elseif mod(N,2) == 1
        y_Hh = (H+h).*ones(1, floor(N/2));
    end
    
    figure; % Create a new figure
    hold on; % Keep the current plot
    
    for i = 1:k2
        scatter(hline_seg_upper(i, :), y_Hh', "filled");
    end
    
    for i = 1:k2
        scatter(hline_seg_lower(i, :), y_h', "filled");
    end
    
    for i = 1:length(vline_seg)
        scatter(X, vline_seg(i,:), "filled");
    end
    
    hold off; % Release the hold

    xlabel('x');
    ylabel('y');
    title('Žica v polju');
    
end