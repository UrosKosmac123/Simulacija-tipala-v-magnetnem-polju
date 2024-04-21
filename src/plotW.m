function plotW(x0, h, H, L, N, n)
    
    % Izriše žico v ravnini.
    
    % x0 - horizontalni začetek žice.
    % h - dvig nad x-osjo.
    % H - vertikalna dolžina žice.
    % L - horizontalna dolžina žice. 
    % N - št. prepogibanj.
    % n - št. točk s katerimi aproksimiramo žico.
    
    [vline_seg, hline_seg_lower, hline_seg_upper, X] = current_den(x0, h, H, L, N, n);
    
    x = L/(N-1);    % dolžina kratkega dela prepognjene žice.
    
    k1 = floor((N*H/(N*H + L))*n);   % relativen delež točk na vertikalnih dolžinah
    k2 = floor((L/(N*H + L))*n);     % relativen delež točk na horizontalnih dolžinah   
    
    y_h = h.*ones(1, (floor(N/2)));
    
    if mod(N,2) == 0
        y_Hh = (H+h).*ones(1, (floor(N/2)-1));
    elseif mod(N,2) == 1
        y_Hh = (H+h).*ones(1, floor(N/2));
    end
    
    figure;
    hold on;
    
    for i = 1:k2
        scatter(hline_seg_upper(i, :), y_Hh', "filled");
    end
    
    for i = 1:k2
        scatter(hline_seg_lower(i, :), y_h', "filled");
    end
    
    for i = 1:k1
        scatter(X, vline_seg(i,:), "filled");
    end
    
    
    hold off; % Release the hold

    xlabel('x');
    ylabel('y');
    title('Žica v polju');
    
end