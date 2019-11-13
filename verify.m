load "prime-and-degrees.m";
load "field_in_magma.m";

//b:=[0,1,1,1,1,0,2,1,2,1,1,1,2,1,2,1,1,0,0,2,0];// b value for 28 smooth poly
b:=[ 0, 0, 1, 2, 2, 1, 1, 0, 2, 0, 0, 0, 2, 2, 2, 0, 0, 2, 0, 0, 0 ];// b value for 30 smooth poly

load "basis_matrix_printed.m";
load "part_soln_printed.m";

load "powers_of_U_from_0_to_d_minus_1.m";
sum:=0;
null:=Read("nullity_printed.m");
null:=StringToInteger(null);

for k in [1..d] do
	a_value:=0;
	for j in [1..null] do
		a_value:=a_value+(b[j]*basis_seq[j][k]);
	end for;
	a_value:=a_value+part_soln[k];
	sum:=sum+a_value*seq_powers_of_U[k];
end for;

V:=sum;
load "target_poly.m";
W:=V*T0;

printf "\n Factorisation(Polynomial(W))=%o",Factorisation(Polynomial(W));

printf "\n \n";
printf "\n #################################################################";
printf "\n The value of the vector b=%o",b;
printf "\nThe maximum degree among all the factors of the obtained polynomial is Degree(Factorisation(Polynomial(W))[#Factorisation(Polynomial(W))][1])=%o",Degree(Factorisation(Polynomial(W))[#Factorisation(Polynomial(W))][1]);
