 % Set default values 
% 
% fh = findall(0,'Type','Figure');
% set( findall(fh, '-property', 'fontsize'), 'fontsize', 20)

am = 0.89;

Ks=195;Ts=0.86;T0=0.01; 

G = tf([Ks],[Ts 1])
Gd = c2d(G,T0)
Gd.variable = 'z^-1'

% 
% G2 = tf([Ks],[Ts 1])
% Gd2 = c2d(G2,0.01)
% Gd2.variable = 'z^-1'

% 6G = tf([Ks],[Ts 1 0])
% Gd = c2d(G,0.01)
% Gd.variable = 'z^-1'
% 
% G2 = tf([Ks],[Ts 1])
% Gd2 = c2d(G2,0.01)
% Gd2.variable = 'z^-1'
 
% Servo_ResetEncoders;
K=[0.06  0.0 0.0125]; 
TLC2PWD;                            

