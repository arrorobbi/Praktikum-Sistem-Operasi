#!/bin/bash
#!/bin/ksh

declare -a array
i=0;

select menu in "luas kubus" "luas permukaan prisma segitiga" "luas permukaan limas persegi" "nilai tengah dari ketiga luas permukaan" "keluar"
do
 case $menu in
  "luas kubus")
   echo -n "Masukkan Sisi Kubus : "
	read sisi
	let kubus=6*$sisi*$sisi
	let array[$i]=$kubus
	echo ${array[$i]}
	let i=$i+1
	echo "Rumus = 6 X Sisi X Sisi : $kubus"
	;;
   


  "luas permukaan prisma segitiga")
   echo -n "Masukkan Alas : "
	read alas
	echo -n "Masukkan Tinggi Alas : "
	read ta
	echo -n "Masukkan Luas Salah Satu Bidang Tegak : "
	read bt
	let luasalas=1/2*$alas*$ta
	let bidangtegak=3*bt
	let prismasegitiga=2*$luasalas+3*$bidangtegak
	let array[$i]=$prismasegitiga
	echo ${array[$i]}
	let i=$i+1
	echo "Rumus = (2 X luas alas) + (3 X luas salah satu bidang tegak) : $prismasegitiga"
	;;

  "luas permukaan limas persegi")
    echo -n "Masukkan Sisi Alas : "
	read sisi
	echo -n "Masukkan Tinggi Selimut : "
	read selimut
	let L=$sisi*$sisi
	let LS=4*1/2*$sisi*$selimut
	let LP=$L+$LS
	let array[$i]=$LP
	echo ${array[$i]}
	let i=$i+1
	echo "Rumus = (s x s) + (4 x 1/2 x s x t.selimut) : $LP "
	;;


  "nilai tengah dari ketiga luas permukaan")
   
   echo ${array[@]}

   for((x=0;x<i-1;x++))
   do
    let small=${array[$x]};
    let index=$x;
   	for((y=x+1;y<i;y++))
   	do
   		if((array[$y]<small));
 		then
   			let small=${array[$y]};
   			let index=$y;
  		fi
   	done
    let temp=${array[$x]};
    let array[$x]=${array[$index]};
    let array[$index]=$temp;
   done

    for ((x=0;x<$i;x++))
     do	
   	echo -n ${array[$x]} " "
     done
	
   let m=$i%2
   if(($m==0))
   then 
    let x=($i/2);
    let median=(${array[$x-1]}+${array[$x]})/2;
    echo ${array[$x-1]} ${array[$x]} ;
    echo $x;
   else 
    let x=$i/2;
    let median=${array[$x]};	
   fi 
   
   echo "median adalah "$median
    

   ;;

  "keluar")
   echo "terima kasih"
   exit 1
   ;;

 esac
done
