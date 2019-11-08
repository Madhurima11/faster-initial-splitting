lo := StringToInteger(lo);
hi := StringToInteger(hi);
server_id:=StringToInteger(server_id);
nservers:=StringToInteger(nservers);

avg:=(hi-lo+1) div nservers;
lo_server:=((server_id-1)*avg)+lo;
if server_id ne nservers then
	hi_server:=lo_server+avg-1;
else
	hi_server:=hi;
end if;
	
PrintFile("lo_server.txt",lo_server:Overwrite:=true);
PrintFile("hi_server.txt",hi_server:Overwrite:=true);
