function [C, dd,du] = mpc_ograniczenia_bez_y(dumax,dumin,umax,umin,nu)

vec1 = ones(nu);
%Macierz C (ub - upper bound, lb - lower bound)

Cdu_ub = eye(nu);
Cdu_lb = -1 * eye(nu);
Cdu = [Cdu_ub;Cdu_lb];

Cu_ub = eye(nu);
Cu_lb = -1 * eye(nu);
Cu = [Cu_ub;Cu_lb];
E = tril(vec1);

C = [Cdu;Cu*E];

%Wektor przeszłych u
L = ones(nu,1);
du = [zeros(2*nu,1) ; -Cu*L];

%Wektor ograniczeń dd

du_max = ones(nu,1) * dumax;
du_min = -1 * ones(nu,1) * dumin;
du_bound = [du_max;du_min];

u_max = ones(nu,1) * umax;
u_min = -1 * ones(nu,1) * umin;
u_bound = [u_max;u_min];

dd = [du_bound ; u_bound];