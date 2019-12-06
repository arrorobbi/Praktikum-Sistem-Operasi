echo -n "Masukkan Angka : ";
read i;

x=0;
while [ $x -le $i ]
do 
  if [[ 0 -eq "($x%3) + ($x%5)" ]]
  then
    echo "fizzbuzz"
	elif [[ 0 -eq "($x%3)" ]]
	then
	    echo "fizz"
	elif [[ 0 -eq "($x%5)" ]]
	then
	    echo "buzz"
	else
	    echo "$x"
  fi
  x=$(( $x+1 ))
done
