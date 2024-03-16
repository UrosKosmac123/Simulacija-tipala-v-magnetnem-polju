[x,y] = meshgrid(-2:0.05:2, -0.5:0.05:1.5);
[u, v] = B(x,y,50, 2, 1e-7, 2);
quiver(x,y,u,v,"r");
