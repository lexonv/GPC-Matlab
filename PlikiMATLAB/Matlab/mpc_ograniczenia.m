function [C, dd,du,ddu,dy] = mpc_ograniczenia(dumax,dumin,umax,umin,ymax,ymin,nu,H,P,Q,ilosc_du,ilosc_y)

ny = size(H,1);
A = ones(ny);
vec1 = ones(nu);
E = tril(vec1);
L = ones(nu,1);

%Macierz C (ub - upper bound, lb - lower bound)

Cdu_ub = eye(nu);
Cdu_lb = -1 * eye(nu);
Cdu = [Cdu_ub;Cdu_lb];

Cu_ub = eye(nu);
Cu_lb = -1 * eye(nu);
Cu = [Cu_ub;Cu_lb];

Cy_ub = eye(ny);
Cy_lb = -1 * eye(ny);
Cy = [Cy_ub;Cy_lb];

C = [Cdu;Cu*E;Cy*H];

%Macierz poprzednich inkrementów du

ddu = -[zeros(2*nu,ilosc_du);zeros(2*nu,ilosc_du);Cy*P];

%Macierz poprzednich u

du = -[zeros(2*nu,1);Cu*L;zeros(2*ny,1)];

%Macierz poprzednich y

dy = -[zeros(2*nu,ilosc_y);zeros(2*nu,ilosc_y);Cy*Q];

%Macierz ograniczeń dd

du_max = ones(nu,1) * dumax;
du_min = -1 * ones(nu,1) * dumin;
du_bound = [du_max;du_min];

u_max = ones(nu,1) * umax;
u_min = -1 * ones(nu,1) * umin;
u_bound = [u_max;u_min];

y_max = ones(ny,1) * ymax;
y_min = -1 * ones(ny,1) * ymin;
y_bound = [y_max;y_min];

dd = [du_bound ; u_bound; y_bound];
