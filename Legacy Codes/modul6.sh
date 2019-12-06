#!/bin/bash
clear
loop=y
while [ $loop == 'y' ]
do
echo "program nilai terbesar kedua "
echo "1. Input Data"
echo "2. View Data"
echo "3. Hasil Jumlah Semua isi Data Array"
echo "4. Exit"
echo "Pilihan :"
read chose

case $chose in
1)
echo "Masukkan banyak array : "
read data

for((i=0;i<$data;i++))
do
    printf "Index Array - $i : "
    read array[i]
done

first=0
for((i=0;i<$data;i++))
do
    if [[ $first -lt ${array[i]} ]]
    then
        let terbesar_prtm=${array[i]}
        let j=i
    fi
done

second=0
index=0
for((i=0;i<$data;i++))
do
    if [[ $i -eq $j ]]
    then
        let i=i+1
        let i=i-1
    else
        if [[ $second -lt ${array[i]} ]]
        then    
            let second=${array[i]}
            let index=i
             fi
    fi
done
printf "\n"
echo "Nilai terbesar kedua di dalam array adalah : $second"
echo "berada pada index array ke : $index"
read
clear
;;

2)
if [[ $data -eq 0 ]]
then
    printf "Data kosong\n"
else
    echo ${array[@]}
fi
read
clear
;;

3)
if [[ $data -eq 0 ]]
then
    printf "\n"
    printf "0\n"
else
    all=${#array[@]};
    tot=0
    for((i=0;i<$all;i++))
    do
        let tot=$(expr "$tot" + "${array[i]}")
    done
echo "Total Data : $tot"
fi
read
clear
;;

4)
printf "\n"
echo "Terima kasih"
exit 1

esac
done

