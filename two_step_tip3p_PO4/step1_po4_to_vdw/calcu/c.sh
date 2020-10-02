####1. get the dvdl for each lamada for charge disappearing steps

for a in 0.00922 0.04794 0.11505 0.20634 0.31608 0.43738 0.56262 0.68392 0.79366 0.88495 0.95206 0.99078
do
awk -f dvdl_direct.awk ../$a/us.out > cd_$a'_temp1.txt'
awk '!a[$1]++' cd_$a'_temp1.txt' > cd_$a'_temp2.txt'
awk '{ sum += $2} END { printf("%5.5f", sum/NR)}' cd_$a'_temp2.txt' > cd_$a'_dvdl.txt'
done

####3. get the dvdl for cd vd processes
paste cd_0.00922_dvdl.txt cd_0.04794_dvdl.txt cd_0.11505_dvdl.txt cd_0.20634_dvdl.txt cd_0.31608_dvdl.txt cd_0.43738_dvdl.txt cd_0.56262_dvdl.txt cd_0.68392_dvdl.txt cd_0.79366_dvdl.txt cd_0.88495_dvdl.txt cd_0.95206_dvdl.txt cd_0.99078_dvdl.txt > cd_sum_dvdl.txt
awk '{dvdl=($1+$12)*0.02359+($2+$11)*0.05347+($3+$10)*0.08004+($4+$9)*0.10158+($5+$8)*0.11675+($6+$7)*0.12457; printf ("%5.5f", dvdl)}' cd_sum_dvdl.txt > cd_dvdl.txt

###5. get the HFE
paste cd_dvdl.txt > TOTAL_dvdl.txt
awk '{charge=$1; printf ("%5.5f", charge)}' TOTAL_dvdl.txt > 1_CHARGE.txt
