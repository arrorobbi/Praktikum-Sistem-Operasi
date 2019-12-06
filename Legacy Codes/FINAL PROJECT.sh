clear
z=0
menu=0

input(){
	  
    let z=$z+1
	echo "Menu : "
	echo "1.Nasi Geprek 	 Rp.10,000"
	echo "2.Lontong Balap  Rp.10,000"
	echo "3.Lapis Daging 	 Rp.12,000"
	echo "4.Es Teh	 Rp.4,000"
	echo "5.Indomie Goreng Rp.4,500"
	echo "6.Indomie Kuah 	 Rp.5,000"
	echo "======================="
	echo -n "Nama Pelangan : "
	read pelanggan[$z]
	echo -n "Nama Kasir : "
	read kasir[$z]
	echo -n "Tanggal :"
	read tanggal[$z]
	echo -n "Harga menu 1 : "
	read menu1[$z]
	echo -n "Harga menu 2 : "
	read menu2[$z]
	let total=${menu1[$z]}+${menu2[$z]}
	echo "TOTAL $total "
	echo -n "Masukkan Total Harga :"
	read totalharga[$z]
	echo -n "No. Resi : "
	read noreg[$z]
           
}


mutasitagihan(){

	   for((a=1;a<=z;a++))
	do
		echo ""
		echo ""
		echo "Mutasi Tagihan"
		echo "Tagihan a/n ${pelanggan[$a]}"
		echo "No.Resi ${noreg[$a]}"
		echo "Tanggal ${tanggal[$a]}"
		echo "Total Harga ${totalharga[$a]}"
	done
}

search(){
	    echo -n "Masukkan No Resi     : "
            read cari
            a=0
            b=0
            while [ $a -le $z ] && [ $b == 0 ]
		do
                        let a=$a+1
                        if [ "${noreg[a]}" == $cari ]
                        then
				b=1
                        fi
            done
}

delete(){
	echo "HAPUS DATA TRANSAKSI"
	echo "Jika Salah Memilih Menu Tekan Enter"
	echo "==================================="
	    search
	    if [ $a -gt $z ]
            	then
                        echo "Data Tidak Ada"
            else
                        while [ $a -lt $z ]
                        	do
                                    let b=$a+1
				    pelanggan[$a]=${pelanggan[$b]}
				    kasir[$a]=${kasir[$b]}
				    menu1[$a]=${menu1[$b]}
                                    menu2[$a]=${menu2[$b]}
                                    totalharga[$a]=${totalharga[$b]}
				    resi[$a]=${noreg[$b]}
                                    let a=$a+1
                        done
                        let z=$z-1
                        echo "Data Transaksi $cari Berhasil Dihapus"
            fi
}


datapemasukan(){
for((a=1;a<=z;a++))
	do
		echo ""
		echo ""
		echo "- - -DATA PEMBELIAN $a- - -"
		echo "Nama Pelangan 		: ${pelanggan[$a]}"
		echo "Nama Kasir 		: ${kasir[$a]}"
		echo "Tanggal 		: ${tanggal[$a]}"
		echo "Harga menu 1 		: ${menu1[$a]}"
		echo "Harga menu 2	 	: ${menu2[$a]}"
		echo "Total Harga		: ${totalharga[$a]}"
		echo "No. Resi 		: ${noreg[$a]}"
	done
}



update(){
	echo "UPDATE DATA TRANSAKSI"
	echo "Jika Salah Memilih Menu Tekan Enter"
	echo "==================================="
	    search
	    if [ $a -le $z ]
            	then
			echo "- - -DATA PEMBELIAN $a- - -"
			echo "Nama Pelangan 		: ${pelanggan[$a]}"
			echo "Nama Kasir 		: ${kasir[$a]}"
			echo "Tanggal 		: ${tanggal[$a]}"
			echo "Harga menu 1 		: ${menu1[$a]}"
			echo "Harga menu 2	 	: ${menu2[$a]}"
			echo "Total Harga		: ${totalharga[$a]}"
			echo "No. Resi 		: ${noreg[$a]}"
                        echo "- - --- - -"
			echo -n "Nama Pelangan : "
			read pelanggan[$z]
			echo -n "Nama Kasir : "
			read kasir[$z]
			echo -n "Tanggal :"
			read tanggal[$z]
			echo -n "Harga. menu 1 : "
			read menu1[$z]
			echo -n "Harga menu 2 : "
			read menu2[$z]
			let total=${menu1[$z]}+${menu2[$z]}
			echo "TOTAL $total "
			echo -n "Masukkan Total Harga :"
			read totalharga[$z]
			echo -n "No. Resi : "
			read noreg[$z]
			echo "=============================================================="
                        echo "Harga Menu 1				: Rp ${menu1[$z]}"
                        echo "Harga Menu 2				: Rp ${menu2[$z]}"
			echo "====	Total Yang Harus Anda Bayar	: Rp ${totalharga[$z]}"
			echo "=============================================================="
            else
                        echo "Data Tidak Ada"
            fi
           
}


cetak(){
	    search
            if [ $a -le $z ]
            	then
			echo ""
		echo ""
		echo "- - -DATA TRANSAKSI $a- - -"
		echo "Nama Pelangan 		: ${pelanggan[$a]}"
		echo "Nama Kasir 		: ${kasir[$a]}"
		echo "Tanggal 		: ${tanggal[$a]}"
		echo "No. Resi 		: ${noreg[$a]}"
		echo "=============================================================="
                echo "Harga Menu 1				: Rp ${menu1[$a]}"
                echo "Harga Menu 2				: Rp ${menu2[$a]}"
		echo "====	Total Yang Harus Anda Bayar	: Rp ${totalharga[$a]}"
		echo "=============================================================="
            else
                        echo "Data Tidak Ada!!"
            fi
}


while [ $menu != 7 ]
do
	echo "#	**KASIR KANTIN 86**		#"
  	echo ""
        echo "1.Input Transaksi"
        echo "2.Mutasi Pembelian"
	echo "3.Search"
        echo "4.Data Transaksi"
	echo "5.Delete Informasi Kasir"
	echo "6.Update Informasi Kasir"
	echo "7.Exit"
        echo -n "Masukkan Pilihan Anda : "
            read menu
            if [ $menu -eq 1 ]
            	then
		clear
                        input  
            elif [ $menu -eq 2 ]
            	then
		clear
			if [ $z -lt 1 ]
				then
                                    echo "kosong "
                	else
                                    mutasitagihan
                	fi
	    elif [ $menu -eq 3 ]
	    	then
		clear
			cetak
            elif [ $menu -eq 4 ]
            	then
		clear
                        datapemasukan
            elif [ $menu -eq 5 ]
            	then
		clear
                        delete
            elif [ $menu -eq 6 ]
            	then
		clear
                        update
            elif [ $menu -eq 7 ]
            	then
		clear
                        echo "	**Terimakasih Telah Menggunakan Layanan Kami :)**	"          
            else
                        echo "Menu Yang Anda Inputkan Salah!"
            fi
            echo ""
done
