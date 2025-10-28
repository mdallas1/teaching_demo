function harmonic_oscillator(N,solver) 
	% ===========================
	%
	% harmonic_oscillator(N,solver)
	%
	% N is the number of nodes, and 
	% solver = 'fwd_euler', 'rk2', 
	% or 'rk4'.
	%
	% SOLVES THE MODEL PROBLEM 
	% x''(t) + x(t) = 0, 
	% x(0) = 1, x'(0) = 0. 
	% OVER THE INTERVAL [a,b]. 
	% 
	% WE FIRST EXPRESS THE 2ND 
	% ORDER ODE AS A FIRST ORDER
	% SYSTEM, AND THEN WE SOLVE 
	% THIS SYSTEM. 
	% 
	% b=20 IS A NICE CHOICE.
	% ===========================

	% SETUP	
	f = @(x,y) [y(2);-y(1)]; 
	y0 = [1;0]; a = 0; b = 20; 
	h = (b-a)/(N-1);
	
	% FORWARD EULER
	if strcmp(solver,'fwd_euler')
		y = fwd_euler(a,b,y0,f,N); 
		figtitle = 'Foward Euler'; 
		lin = 'b--';
	elseif strcmp(solver,'bck_euler')
		% BACKWARD EULER 
		y = bck_euler(a,b,y0,f,N);
		figtitle = 'Backward Euler';
	elseif strcmp(solver,'rk2')
		% RK2	
		y = rk2(a,b,y0,f,N); 
		figtitle = 'RK2';
		lin = 'k--';
	elseif strcmp(solver,'rk4')
		% RK4
		y = rk4(a,b,y0,f,N);
		figtitle = 'RK4';
		lin = 'm-.';
	elseif strcmp(solver,'mod_euler') 
		y = mod_euler(a,b,y0,f,N); 
		figtitle = 'Mod Euler'; 
		lin = 'g-o';
	end

	% PLOT SOLUTION
	t = linspace(a,b); 
	figure(1)	
	if isempty(get(gcf,'Children'))	
		grid on, hold on 
		plot(cos(t),sin(t),'r','linewidth',1.5,'DisplayName','Exact Soln');
		plot(y(1,:),y(2,:),lin,'linewidth',1.5,'DisplayName',figtitle); 
	else
		plot(y(1,:),y(2,:),lin,'linewidth',1.5,'DisplayName',figtitle); 
	end
	legend('location','northeast');
	xlabel("x"); ylabel("v"); title([figtitle ", h = ", num2str(h,2)]);
	set(gca,'fontsize',24);

	figure(2)
	if isempty(get(gcf,'Children'))
		grid on, hold on 
		plot(t,cos(t),'r','linewidth',1.5,'displayname','Exact Position');
		plot(a:(b-a)/(N-1):b,y(1,:),lin,'linewidth',1.5,'displayname',figtitle); 
	else 
		plot(a:(b-a)/(N-1):b,y(1,:),lin,'linewidth',1.5,'displayname',figtitle);
	end
	legend('location','northwest');
	xlabel("t"); ylabel("x"); title([figtitle ", h = ", num2str(h,2)]);
	set(gca,'fontsize',24);		

	figure(1)
