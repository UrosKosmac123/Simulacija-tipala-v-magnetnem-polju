function Res = R(x0, h, H, L, N, B0, r0, lambda, epsilon, k)
    
    f =@(x) r0*(1 + 0.02*x.^2);
    [cosphi_v, cosphi_l, cosphi_u] = angles2(x0, h, H, L, N, B0, lambda, epsilon, k);
    
    [v, h_l, h_u, X] = current_den(x0, h, H, L, N, k);
    
    r_v = f(cosphi_v);
    r_l = f(cosphi_l);
    r_u = f(cosphi_u);
    
   int_v = 0; 
   for i=1:N
       s = trapz(v(:,i), r_v(:,i));
       int_v = int_v + s;
   end
   
   int_l = 0; 
   for i=1:floor(N/2)
      s = trapz(h_l(:,i), r_l(:,i));
      int_l = int_l + s;
   end
   
   int_u = 0; 
   for i=1:(floor(N/2)-1)
       s = trapz(h_u(:,i), r_u(:,i));
       int_u = int_u + s;
   end
   
   
   Res = int_v + int_l + int_u;