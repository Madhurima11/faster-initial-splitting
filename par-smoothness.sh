begin_initial=$(date +"%s")
rm obtained.txt

nservers=4

nthreads=2
p=3
read -p "enter id of the server in which you are doing " server_id

time_file="time_for_smoothness_finding_for_server_id_"$server_id".txt"
obtained_file=obtained-server_id-"$server_id".txt
rm $obtained_file
wait
lo_val=1
nullity=$(<nullity_printed.m)


magma lo:=$lo_val p:=$p nullity:=$nullity server_id:=$server_id nservers:=$nservers distribute-by-nullity.m &
wait
lo_server=$(<"lo_server"$server_id".txt")
hi_server=$(<"hi_server"$server_id".txt")

lo=$lo_server
hi=$hi_server
leap=$((($hi-$lo+1)/$nthreads))
nbigsteps=$((($hi-$lo+1)-($nthreads*$leap)))
result_dir="result_dir_server_id-"$server_id""
rm -r $result_dir

for((i=1; i<=$nbigsteps; i++))
do 
	thread_id=$i
        hi=$(($lo+$leap))
	result_file="result_smoothness-server_id-"$server_id"-thread_id-"$thread_id"-lo-"$lo"-hi-"$hi".dat"
	magma -b strlo:=$lo strhi:=$hi server_id:=$server_id thread_id:=$thread_id obtained_file:=$obtained_file smoothness.m > $result_file &
	echo "lo=$lo, hi=$hi"
        lo=$(($hi+1))
done

for((i=$(($nbigsteps+1)); i<=$nthreads; i++))
do
	thread_id=$i
       	hi=$(($lo+$leap-1))
	result_file="result_smoothness-server_id-"$server_id"-thread_id-"$thread_id"-lo-"$lo"-hi-"$hi".dat"
	magma -b strlo:=$lo strhi:=$hi server_id:=$server_id thread_id:=$thread_id obtained_file:=$obtained_file smoothness.m > $result_file &
	echo "lo=$lo, hi=$hi"
	lo=$(($hi+1))
done
wait

mkdir $result_dir
mv result_smoothness-server_id-"$server_id"* $result_dir/

termin_all=$(date +"%s")
difftimelps=$(($termin_all-$begin_initial))
echo "//$(($difftimelps / 60)) minutes and $(($difftimelps % 60))seconds elapsed for smoothness finding"
