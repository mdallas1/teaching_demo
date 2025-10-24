function y = bck_euler(a,b,y0,f,N)
  % ==============================
  % BACKWARD EULER METHOD FOR
  % CAUCHY PROBLEM y' = f(t,y)
  % ON [a,b] with y(0) = y0
  % WITH N NODES.
  % ==============================
	nn = size(y0,1); 
  y = zeros(nn,N); y(:,1)=y0; h = (b-a)/(N-1);
  nodes = a:h:b;
  for k = 2:N
    yprev = y(:,k-1);
		euler_fun = @(y) y - yprev - h*f(nodes(k),y);
    y(:,k) = fsolve(euler_fun,yprev);
  end
