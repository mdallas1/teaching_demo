function harmonic_oscillator(N,solver) 
	% ===========================
	% SOLVES THE MODEL PROBLEM 
	% x''(t) + x(t) = 0, 
	% x(0) = 1, x'(0) = 0. 
	% OVER THE INTERVAL [a,b]. 
	% 
	% WE FIRST EXPRESS THE 2ND 
	% ORDER ODE AS A FIRST ORDER
	% SYSTEM, AND THEN WE SOLVE 
	% THIS SYSTEM. 
	% ===========================
	close all 

	% SETUP	
	f = @(x,y) [y(2);-y(1)]; 
	y0 = [1;0]; a = 0; b = 20; 
	h = (b-a)/(N-1);
	
	% FORWARD EULER
	if strcmp(solver,'fwd_euler')
		y = fwd_euler(a,b,y0,f,N); 
		figtitle = 'Foward Euler'; 
	elseif strcmp(solver,'bck_euler')
		% BACKWARD EULER 
		y = bck_euler(a,b,y0,f,N);
		figtitle = 'Backward Euler';
	elseif strcmp(solver,'rk2')
		y = rk2(a,b,y0,f,N); 
		figtitle = 'RK2';
	elseif strcmp(solver,'rk4')
		y = rk4(a,b,y0,f,N);
		figtitle = 'RK4';
	elseif strcmp(solver,'fwdbck_euler') 
		y_fwd = fwd_euler(a,b,y0,f,N);
		y_bck = bck_euler(a,b,y0,f,N);
	end

	% PLOT SOLUTION
	t = linspace(a,b); 
	figure(1), grid on, hold on 
	plot(cos(t),sin(t),'b','linewidth',1.5);
	plot(y(1,:),y(2,:),'r--','linewidth',1.5); 
	%plot(a:(b-a)/(N-1):b,y,'b--o','linewidth',1.5);
	legend('Exact Soln','Computed Soln','location','northeast');
	xlabel("x"); ylabel("v"); title([figtitle ", h = ", num2str(h,2)]);
	set(gca,'fontsize',24);

	figure(2), grid on, hold on 
	plot(t,cos(t),'b','linewidth',1.5);
	plot(a:(b-a)/(N-1):b,y(1,:),'r--','linewidth',1.5); 
	%plot(a:(b-a)/(N-1):b,y,'b--o','linewidth',1.5);
	legend('Exact Soln','Computed Soln','location','northeast');
	xlabel("t"); ylabel("x"); title([figtitle ", h = ", num2str(h,2)]);
	set(gca,'fontsize',24);		

