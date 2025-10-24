function y = rk4(a,b,y0,f,N)
  % ===============================
  % FOURTH ORDER RUNGE-KUTTA METHOD
  % FOR CAUCHY PROBLEM y' = f(t,y)
  % ON [a,b] with y(0) = y0 
  % WITH N NODES.
  % ===============================
	nn = size(y0,1); 
  y = zeros(nn,N); y(:,1)=y0; h = (b-a)/(N-1);
  nodes = a:h:b;
  for k = 2:N
		s1 = f(nodes(k-1),y(:,k-1));
	  s2 = f(nodes(k-1)+0.5*h,y(:,k-1)+0.5*h*s1);
		s3 = f(nodes(k-1)+0.5*h,y(:,k-1) + 0.5*h*s2);
		s4 = f(nodes(k-1)+h,y(:,k-1)+h*s3);
    y(:,k) = y(:,k-1) + h * (s1+2*s2+2*s3+s4)/6;
  end
