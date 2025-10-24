function exponential_model(k,N,solver) 
	% ===========================
	% SOLVES THE MODEL PROBLEM 
	% y'(t) = k*y(t), y(0) = 1 
	% OVER THE INTERVAL [0,6]. 
	% k=-3 RESULTS IN NICE PLOTS.
	%	TRY N = 9, 10, 11. 
	% ===========================
	close all 

	% SETUP	
	f = @(x,y) k*y; 
	y0 = 1; a = 0; b = 6; 
	
	% FORWARD EULER
	if strcmp(solver,'fwd_euler')
		y = fwd_euler(a,b,y0,f,N); 
	elseif strcmp(solver,'bck_euler')
		% BACKWARD EULER 
		y = bck_euler(a,b,y0,f,N);
	elseif strcmp(solver,'fwdbck_euler') 
		y_fwd = fwd_euler(a,b,y0,f,N);
		y_bck = bck_euler(a,b,y0,f,N);
	end
	
	% PLOT SOLUTION
	t = linspace(a,b); 
	g = @(x) y0*exp(k*x);
	figure(1), grid on, hold on 
	plot(t,g(t),'r','linewidth',1.5); 
	plot(a:(b-a)/(N-1):b,y,'b--o','linewidth',1.5);
	legend('Exact Soln','Computed Soln','location','northeast');
	set(gca,'fontsize',36);

