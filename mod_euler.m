function y = mod_euler(a,b,y0,f,N)
	% ==================================
	% y = mod_euler(a,b,y0,f,N)
	% 
  % MODIFIED EULER METHOD
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
  y = zeros(nn,N); y(:,1)=y0; h = (b-a)/(N-1);
  nodes = a:h:b;
  for k = 2:N
		s1 = f(nodes(k-1),y(:,k-1)); 	
	  s2 = f(nodes(k-1)+0.5*h,y(:,k-1)+0.5*h*s1);
    y(:,k) = y(:,k-1) +  h * s2;
  end
