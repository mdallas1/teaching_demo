function y = fwd_euler(a,b,y0,f,N)
  % ==============================
  % FORWARD EULER METHOD FOR 
  % CAUCHY PROBLEM y' = f(t,y)
  % ON [a,b] with y(0) = y0 WITH
  % N NODES.
  % ==============================
	nn = size(y0,1); 
  y = zeros(nn,N); y(:,1)=y0; h = (b-a)/(N-1);
  nodes = a:h:b;
  for k = 2:N
    yprev = y(:,k-1);
    y(:,k) = yprev + h * f(nodes(k-1),yprev);
  end
