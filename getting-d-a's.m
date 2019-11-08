t1:=Realtime();
t0:=Cputime();
load "prime-and-degrees.m";
load "field_in_magma.m";
printf "\n to load the field";
printf "\n Cputime is %o",Cputime(t0);
printf "\n Realtime is %o",Realtime(t1);
null:=Read("nullity_printed.m");

null:= StringToInteger(null);



load "w_1_a-seq.m";
load "basis_matrix_printed.m";
load "part_soln_printed.m";

seq_added_basis_part_soln:=[];
sum:=0;
for j in [1..null] do
	sum:=0;
	tmp_seq:=[];
	for k in [1..d] do
		sum:=sum+basis_seq[j][k]*seq_w_1_a[k];
	end for;
	tmp_seq:=[sum,2*sum];
	Append(~seq_added_basis_part_soln,tmp_seq);	
end for;

sum:=0;
for k in [1..d] do
	sum:=sum+part_soln[k]*seq_w_1_a[k];
end for;	

PrintFile("file_added_basis_parts_mult_w_seq.m","added_basis_parts_mult_w:=":Overwrite:=true);
PrintFile("file_added_basis_parts_mult_w_seq.m",seq_added_basis_part_soln);
PrintFile("file_added_basis_parts_mult_w_seq.m",";");


PrintFile("file_added_part_soln_mult_w_seq.m","part_soln_mult_w_seq:=":Overwrite:=true);
PrintFile("file_added_part_soln_mult_w_seq.m",sum);
PrintFile("file_added_part_soln_mult_w_seq.m",";");
printf "\n for getting a's";
printf "\n Cputime is %o",Cputime(t0);
printf "\n Realtime is %o",Realtime(t1);

