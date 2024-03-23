% Izriše tokovnice magnetnega polja

[x,y] = meshgrid(-4:0.05:4, -2:0.05:2);
[u, v] = B(x,y,50, 2, 1e-7, 2);
quiver(x,y,u,v,"r");
