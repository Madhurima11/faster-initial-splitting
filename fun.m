function beta_at_position(i,length)
	beta:=[];
	for j in [1..length] do
		q:=i div (p^(length-j));
		q:=q mod p;
		Append(~beta,q);	
	end for;
	return beta;
end function;

function is_B1_smooth(poly)
	temp_square_free:=SquarefreeFactorization(poly);
	for i in [1..#temp_square_free] do
		if (Degree(temp_square_free[i][1]) gt B1) then
			temp_ddf:=DistinctDegreeFactorization(temp_square_free[i][1]);
			smoothness_deg:=Max([temp_ddf[i][1]: i in [1..#temp_ddf]]);
			if (smoothness_deg gt B1) then
				return false;
			end if;
		end if;	
	end for;
	return true;
end function;
