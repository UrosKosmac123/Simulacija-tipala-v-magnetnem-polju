function sgn = current_sgn(j)
    
    % Smer vektorja tokovne gostote j.
    
    if mod(j,2) == 0
        sgn = 1;
    else
        sgn = -1;
    end
end
        