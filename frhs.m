function out = frhs(t,y)
  mass = 1; g = 9.8;
  Phix = 2*y(1); Phiy = 2*y(2); Phiz = 2*y(3);
  G = [Phix ; Phiy ; Phiz];
  F = [0 ; 0 ; -g*mass];

  b = zeros(6,1); b(end) = -g;
  lambda = (2*mass * dot(y(4:6),y(4:6)) + dot(G,F)) / dot(G,G);
  A = zeros(6,6); u = -2*lambda/mass * ones(3,1);
  A = A + diag(ones(3,1),3) + diag(u,-3);

  out = A*y + b;
end
