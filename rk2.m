function y = rk2(a,b,y0,f,N)
  % ==============================
  % FORWARD EULER METHOD SOLVING
  % CAUCHY PROBLEM y' = f(t,y)
  % ON [a,b] with y(0) = y0.
  % N IS THE NUMBER OF NODES.
  % ==============================
	nn = size(y0,1); 
  y = zeros(nn,N); y(:,1)=y0; h = (b-a)/(N-1);
  nodes = a:h:b;
  for k = 2:N
		s1 = f(nodes(k-1),y(:,k-1));
	  s2 = f(nodes(k-1)+h,y(:,k-1)+h*s1);
    y(:,k) = y(:,k-1) + 0.5 * h * (s1+s2);
  end
