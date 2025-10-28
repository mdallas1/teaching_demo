% =================================
% 
% This script approximates a 
% to the spherical pendulum problem. 
%  
% Taken from page 313 of 
%
% @book{SciComputMATLAB, 
% 			authors = {A. Quarteroni and
%				F. Saleri	and P. Gervasio}, 
%				title = {Scientific Computing 
%				with MATLAB and Octave}, 
%				year = {2014}, 
%				publisher = {Springer-Verlag}
%
% ================================

close all
t0 = 0; T=25; y0=[0 1 0 0.8 0 1.2]';
ff = @(t,y) frhs(t,y);
y_fe = fwd_euler(t0,T,y0,ff,1e4);
y_rk2 = rk2(t0,T,y0,ff,1e4); 
y_rk4 = rk4(t0,T,y0,ff,1e4);
tt = t0:(T-t0)/(1e4-1):T;

r_fe = max(abs(y_fe(1,:).^2 + y_fe(2,:).^2 + y_fe(3,:).^2 - 1))
r_rk2 = max(abs(y_rk2(1,:).^2 + y_rk2(2,:).^2 + y_rk2(3,:).^2 - 1))
r_rk4 = max(abs(y_rk4(1,:).^2 + y_rk4(2,:).^2 + y_rk4(3,:).^2 - 1))

figure(1), hold on, grid on
plot3(y_fe(1,:),y_fe(2,:),y_fe(3,:))
plot3(y0(1),y0(2),y0(3),'or','Linewidth',1.2)
title("Forward Euler Solution","FontSize",16);
view(30,35);

figure(2), hold on, grid on
plot3(y_rk2(1,:),y_rk2(2,:),y_rk2(3,:))
plot3(y0(1),y0(2),y0(3),'or','MarkerSize',10,'MarkerFaceColor','r')
title("RK2 Solution","FontSize",16);
view(30,35);

figure(3), hold on, grid on
plot3(y_rk4(1,:),y_rk4(2,:),y_rk4(3,:))
plot3(y0(1),y0(2),y0(3),'or','MarkerSize',10,'MarkerFaceColor','r')
title("RK4 Solution","FontSize",16);
view(30,35);


