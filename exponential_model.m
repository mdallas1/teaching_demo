function exponential_model(k,N,solver) 
	% ===========================
	% SOLVES THE MODEL PROBLEM 
	% y'(t) = k*y(t), y(0) = 1 
	% OVER THE INTERVAL [0,6]. 
	% k=-3 RESULTS IN NICE PLOTS.
	%	TRY N = 9, 10, 11. 
	% ===========================
	%close all 

	% SETUP	
	f = @(x,y) k*y; 
	y0 = 1; a = 0; b = 1; h = (b-a)/(N-1);
	
	% FORWARD EULER
	if strcmp(solver,'fwd_euler')
		y = fwd_euler(a,b,y0,f,N); 
		figtitle = 'Foward Euler'; 
	elseif strcmp(solver,'bck_euler')
		% BACKWARD EULER 
		y = bck_euler(a,b,y0,f,N);
		figtitle = 'Backward Euler';
	elseif strcmp(solver,'rk2')
		% RK2	
		y = rk2(a,b,y0,f,N); 
		figtitle = 'RK2';
	elseif strcmp(solver,'rk4')
		% RK4
		y = rk4(a,b,y0,f,N);
		figtitle = 'RK4';
	elseif strcmp(solver,'mod_euler') 
		y = mod_euler(a,b,y0,f,N); 
		figtitle = 'Mod Euler'; 
		lin = 'g-o';
	end
	
	% PLOT SOLUTION
	t = linspace(a,b); 
	g = @(x) y0*exp(k*x);
	figure(1), grid on, hold on 
	plot(t,g(t),'r','linewidth',2.0); 
	plot(a:(b-a)/(N-1):b,y,'b--o','linewidth',2.0);
	legend('Exact Soln','Computed Soln','location','northeast');
	xlabel("x"); ylabel("y"); title([figtitle ", h = ", num2str(h,2)]);
	set(gca,'fontsize',24);

