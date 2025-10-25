close all
t0 = 0; T=25; y0=[0 1 0 0.8 0 1.2]';
ff = @(t,y) frhs(t,y);
%y_fe = fwd_euler(t0,T,y0,ff,1e3);
%y_be = bck_euler(t0,T,y0,ff,20e3);
y_rk4 = rk4(t0,T,y0,ff,1000);
%y_cn = crank_nicolson(t0,T,y0,ff,1e3);
tt = t0:(T-t0)/(1e4-1):T;

%r_fe = max(abs(y_fe(1,:).^2 + y_fe(2,:).^2 + y_fe(3,:).^2 - 1))
%r_be = max(abs(y_be(1,:).^2 + y_be(2,:).^2 + y_be(3,:).^2 - 1))
%r_cn = max(abs(y_cn(1,:).^2 + y_cn(2,:).^2 + y_cn(3,:).^2 - 1))
r_rk4 = max(abs(y_rk4(1,:).^2 + y_rk4(2,:).^2 + y_rk4(3,:).^2 - 1))

%figure(1), hold on, grid on
%plot3(y_fe(1,:),y_fe(2,:),y_fe(3,:))
%plot3(y0(1),y0(2),y0(3),'or','Linewidth',1.2)
%title("Forward Euler Solution","FontSize",16);

%figure(2), hold on, grid on
%plot3(y_be(1,:),y_be(2,:),y_be(3,:))
%plot3(y0(1),y0(2),y0(3),'or','Linewidth',1.2)
%title("Backward Euler Solution","FontSize",16);

%figure(3), hold on, grid on
%plot3(y_cn(1,:),y_cn(2,:),y_cn(3,:))
%plot3(y0(1),y0(2),y0(3),'or','Linewidth',1.2)
%title("Crank-Nicolson Solution","FontSize",16);

figure(4), hold on, grid on
plot3(y_rk4(1,:),y_rk4(2,:),y_rk4(3,:))
plot3(y0(1),y0(2),y0(3),'or','MarkerSize',10,'MarkerFaceColor','r')
title("Backward Euler Solution","FontSize",16);
view(30,35);


