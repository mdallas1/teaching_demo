function y = crank_nicolson(a,b,y0,f,N)
  % ==================================
	% y = crank_nicolson(a,b,y0,f,N)
	% 
  % CRANK-NICOLSON METHOD
  % FOR SOLVING y' = f(t,y) ON [a,b] 
	% with y(0) = y0. 
	% 
	% - a AND b ARE THE ENDPOINTS. 
	% - y0 IS THE INITIAL CONDITION. 
	%      CAN BE A SCALAR OR VECTOR.
	% - f IS THE RIGHT-HAND-SIDE. 
	% - N IS THE NUMBER OF NODES TO USE.
  % ==================================  
	nn = size(y0,1);
	y = zeros(nn,1); y(:,1)=y0; h = (b-a)/(N-1);
  nodes = a:h:b;
  for k = 2:N
    yprev = y(:,k-1);
    euler_fun = @(u) u - yprev - 0.5*h*( f(nodes(k),u)+f(nodes(k-1),yprev) );
    y(:,k) = fsolve(euler_fun,yprev);
  end
