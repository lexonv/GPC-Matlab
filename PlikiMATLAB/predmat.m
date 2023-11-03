function [C,H] = predmat(A,n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Cwiersze,Ckolumny] = size(A);
same_zera = zeros(1,n);
same_zera(1) = A(1);
Av = zeros(1,n);
Hkolumna = zeros(n,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    for i = 1:Ckolumny
    Av(i) = A(i);
    end

C = toeplitz(Av,same_zera);

    for i = 2:Ckolumny
    Hkolumna(i-1) = A(i);
    end

H = hankel(Hkolumna);

if Ckolumny > 2
    H = H(:,1:Ckolumny-1);
else
    H = H(:,1:Ckolumny);
end



