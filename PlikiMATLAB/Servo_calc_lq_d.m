 % State space representation of servo:
   Ks=195;Ts=0.86;T0=0.01; 
 
   A=[0 1;0 -1/Ts];
   B=[0; Ks/Ts];
   C = [1 0;0 1];
   D = zeros( 2, 1 );
  
   
   % set sampling time
   T0=0.01;   
   % calculate discrete model from continuous
   [Ad,Bd]=c2d(A,B, T0)
   
   % set Q and R matrices
   Q=[85 0;0 0.75];
   R=2;
   
   % design discrete LQ controller
   
   [K,S,lambda]=dlqry(Ad,Bd,C,D,Q,R);
   K(1) = K(1);
   K
  