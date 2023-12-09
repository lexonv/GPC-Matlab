function [M,Mp] = dmc_predmat(ny,nu,D,S)

% Ks=195;Ts=0.86;T0=0.01;
% G = tf(Ks,[Ts 1],"inputdelay",0);
% Gd = c2d(G,T0);
% opt = stepDataOptions('StepAmplitude',1);
% [y,~] = step(Gd,0:T0:T0*500,opt);
% y = y';
% S = y(2:end);
% S = S';

Sn = S(1:ny);

M1 = zeros(ny,ny);
for k1 = 1:ny
    for w1 = 1:k1
        M1(k1,w1) = Sn(k1 - w1 + 1);
    end
end

M = M1(:,1:nu);

Mp = zeros(ny,D-1);

for k = 1:D-1
    for w = 1:ny

    Mp(w,k) = S(w+k) - S(k);

    end
end


