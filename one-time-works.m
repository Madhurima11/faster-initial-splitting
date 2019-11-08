t1:=Realtime();
t0:=Cputime();
load "prime-and-degrees.m";
load "field_in_magma.m";
g:=x1+y^2;
u:=g^((p^n-1) div (p^d-1));
load "target-seq.m";
seq_w_1_a:=[];
mat_seq_transpose:=[];
seq_v_a:=[];
tmp_u:=Fp_n1_n2!1;
modulo_x:=x^(n2-s_value);
for k in [1..d] do
	if(k mod 100 eq 0) then
		printf "\n k=%o",k;
	end if;
	if(k gt 1) then
		tmp_u:=tmp_u*u;
	end if;
	ff_poly:=tmp_u*(Fp_n1_n2!T0);
	tmp_seq:=ElementToSequence(ff_poly);
	for i in [(n2-(s_value+1))..(n2-1)] do
		mat_seq_transpose:=mat_seq_transpose cat ElementToSequence(tmp_seq[i+1],GF(p));
	end for;
	Append(~seq_w_1_a,Polynomial(ff_poly) mod modulo_x);
	Append(~seq_v_a,tmp_u);
end for;

PrintFile("w_1_a-seq.m","seq_w_1_a:=":Overwrite:=true);
PrintFile("w_1_a-seq.m",seq_w_1_a);
PrintFile("w_1_a-seq.m",";");

PrintFile("v_a-seq.m","seq_v_a:=":Overwrite:=true);
PrintFile("v_a-seq.m",seq_v_a);
PrintFile("v_a-seq.m",";");
PrintFile("matrix-seq.m","mat_seq_transpose:=":Overwrite:=true);
PrintFile("matrix-seq.m",mat_seq_transpose);
PrintFile("matrix-seq.m",";");

left_seq:=[1] cat [0:i in [1.. (n1-1)]] cat [0:i in [1.. n1*s_value]] ;
transpose_mat:=Matrix (GF(p),d, n1*(s_value+1),mat_seq_transpose);
PrintFile("matrix_printed.m","transpose_mat:=":Overwrite:=true);
PrintFile("matrix_printed.m",transpose_mat);
PrintFile("matrix_printed.m",";");

left_seq_transpose:=Matrix(GF(p),1, n1*(s_value+1),left_seq);
part_soln,mat_basis:=Solution(transpose_mat, left_seq_transpose);
part_soln:=ElementToSequence(part_soln);
nullity:=#Basis(mat_basis);
PrintFile("nullity_printed.m",nullity:Overwrite:=true);


basis_seq:=[ElementToSequence(Basis(mat_basis)[i]) : i in [1..nullity]];
PrintFile("basis_matrix_printed.m","basis_seq:=":Overwrite:=true);
PrintFile("basis_matrix_printed.m",basis_seq);
PrintFile("basis_matrix_printed.m",";");

PrintFile("part_soln_printed.m","part_soln:=":Overwrite:=true);
PrintFile("part_soln_printed.m",part_soln);
PrintFile("part_soln_printed.m",";");
printf "\n for one time works";
printf "\n Cputime is %o",Cputime(t0);
printf "\n Realtime is %o",Realtime(t1);

