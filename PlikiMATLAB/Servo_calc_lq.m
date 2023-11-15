   % State space representation of servo:
   Ks=195;Ts=0.86;T0=0.01; 
   
   A=[0 1;0 -1/Ts];
   B=[0; Ks/Ts];
   C = [1 0;0 1];
   D = zeros( 2, 1 );
   
   % set Q and R matrices
   Q=[85  0;0 0.75];
   R=2;
   
   % calculate coefficients of the LQ controller
   [K,S,lambda]=lqry(A,B,C,D,Q,R);

   % type K in Matlab command window
   K  