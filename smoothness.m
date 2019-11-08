t1:=Realtime();
t0:=Cputime();
thread_id := StringToInteger(thread_id);
server_id:= StringToInteger(server_id); 
lo := StringToInteger(strlo);
hi := StringToInteger(strhi);
printf "\n thread_id=%o, server_id=%o ",thread_id,server_id;
printf "\n lo=%o, hi=%o",lo,hi;

load "prime-and-degrees.m";
load "field_in_magma.m";
printf "\n to load the field";
printf "\n Cputime is %o",Cputime(t0);
printf "\n Realtime is %o",Realtime(t1);
load "fun.m";
null:=Read("nullity_printed.m");

null:= StringToInteger(null);

load "file_added_part_soln_mult_w_seq.m";
load "file_added_basis_parts_mult_w_seq.m";


for i in [lo..hi] do	
	beta:=beta_at_position(i,null);
	if((i mod 100000) eq 0) then
		printf "\n i=%o",i;
	end if;
	subs_a_in_w1:=part_soln_mult_w_seq;
	for j in [1..null] do
		if(beta[j] gt 0) then
			subs_a_in_w1:=subs_a_in_w1+added_basis_parts_mult_w[j][beta[j]];	
		end if;
	end for;
	
	//printf "\n subs_a_in_w1=%o",subs_a_in_w1;
	if (is_B1_smooth(subs_a_in_w1)) then
		printf "\n B1=%o smooth poly =%o is found",B1,subs_a_in_w1;
		printf "\n at iteration i=%o",i;
		printf "\nbeta=%o",beta;
		PrintFile(obtained_file,"\ndone for thread_id");
		PrintFile(obtained_file,thread_id);
		break;
	elif (i eq hi) then
		printf "\n\nNO B1=%o smooth poly has been found\n\n",B1;
	end if;	
end for;

printf "\n Cputime is %o",Cputime(t0);
printf "\n Realtime is %o",Realtime(t1);
