lo := StringToInteger(lo);
p:= StringToInteger(p);
nullity:= StringToInteger(nullity);
hi:=p^nullity-1;
lo_file:="lo_server" cat server_id cat ".txt";
hi_file:="hi_server" cat server_id cat ".txt";	
server_id:=StringToInteger(server_id);
nservers:=StringToInteger(nservers);


avg:=(hi-lo) div nservers;
lo_server:=(server_id-1)*avg+1;
if server_id ne nservers then
	hi_server:=lo_server+avg-1;
else
	hi_server:=hi;
end if;


PrintFile(lo_file,lo_server:Overwrite:=true);
PrintFile(hi_file,hi_server:Overwrite:=true);
