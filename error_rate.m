close all
nn = 6; N = 10; k = 1; 
f = @(x,y) k*y; 
y0 = 1; a = 0; b = 2; 
y_ex = @(x) y0*exp(k*x);

err_fe = zeros(1,nn); 
err_rk2 = zeros(1,nn);
err_rk4 = zeros(1,nn);
y_fe = zeros(1,nn); 
y_rk2 = zeros(1,nn);
y_rk4 = zeros(1,nn);
h = zeros(1,nn);

for i = 1:nn 
	h(i) = (b-a)/N; 
	nodes = a:(b-a)/(N-1):b;
	y_fe = fwd_euler(a,b,y0,f,N); 
	y_rk2 = rk2(a,b,y0,f,N); 
	y_rk4 = rk4(a,b,y0,f,N);
	err_fe(i) = max(abs(y_fe - y_ex(nodes))); 
	err_rk2(i) = max(abs(y_rk2 - y_ex(nodes)));
	err_rk4(i) = max(abs(y_rk4 - y_ex(nodes)));
	N = 2*N; 
end	
figure(3), hold on
loglog(h,err_fe,'*-b','linewidth',1.5,'displayname','Euler (order 1)');
set(gca,'fontsize',24);
title('Orders of Convergence');
%loglog(h,err_rk2,'d-k','linewidth',1.5,'displayname','RK2');
%loglog(h,err_rk4,'>-r','linewidth',1.5,'displayname','RK4');
loglog(h,h,'*--b','displayname','p=1');
%loglog(h,h.^2,'d--k','displayname','p=2');
%loglog(h,h.^4,'>--r','displayname','p=4');
legend('location','southeast');



		
	
	
