clear
i=0
declare -a nama
declare -a alamat
declare -a nohp
declare -a noktp
declare -a kamera
declare -a hari
declare -a hitung

input() 
{
	echo "Silahkan Isikan Data Diri Dengan Benar"
	echo "Masukkan Nama Anda :"
	read nama[$i]
	echo "Masukkan Alamat Anda :"
	read alamat[$i]
	echo "Masukkan No.Hp :"
	read nohp[$i]
	echo "Masukkan No.KTP :"
	read noktp[$i]
		
clear

	echo "Pilih Jenis Kamera"
	echo "1. Canon Camera Rp.30.000/hari"
	echo "2. Nikon Camera Rp.50.000/hari"
	echo "3. Fuji Camera  Rp.70.000/hari"

	echo "Masukkan Pilihan Kamera :"
	read kamera[$i]
	echo "Masukkan lama Sewa (hari)"
	read hari[$i]
clear

		if (( "${kamera[$i]}" == 1 )) 
		then
			let hitung[$i]=$hari*30000;
			jenis[$i]=Canon
		elif (( "${kamera[$i]}" == 2 ))
		then
			let hitung[$i]=$hari*50000;
			jenis[$i]=Nikon
		elif (( "${kamera[$i]}" == 3 ))
		then
			let hitung[$i]=$hari*70000;
			jenis[$i]=Fuji
		else 
			echo "Masukkan Dengan Benar !!"
			input
		fi
clear
}

view() 
{
	for ((n=0; n<i; n++))
	do
		echo "Data Customer ke-$[n+1]"
		echo "Nama Customer 			:${nama[$n]}"
		echo "Alamat 				:${alamat[$n]}"
		echo "Kontak 				:${nohp[$n]}"
		echo "No.KTP 				:${noktp[$n]}"
		echo "Tagihan Yang Harus Dibayar	:Rp.${hitung[$n]} untuk biaya rental kamera ${jenis[$n]} selama ${hari[$n]} hari"
	done
read
clear
}

search() 
{
	echo "Masukkan No.KTP yang Ingin Dicari :"
	read cari
		s=0
      		while (($cari != ${noktp[$s]}))
      		do
    			s=`expr $s + 1`
 		done
      
   			if (($cari == ${noktp[$s]}));
   			then
    				echo "Nama Customer		: ${nama[s]}"
				echo "Alamat			: ${alamat[s]}"
				echo "Kontak 			: ${nohp[s]}"
				echo "No.KTP			: ${noktp[s]}"
				echo "Tagihan Yang Harus Dibayar:Rp.${hitung[$s]} untuk biaya rental kamera ${jenis[$s]} selama ${hari[$s]} hari"
   			else
    				clear    
    				echo -e "Data Tidak Dapat Ditemukan"
   			fi
   			read
      			clear
}

aplikasi() 
{
        firefox	
}

manipulasi() 
{
ls -l

	echo "Program ini disimpan di berkas bernama fp1.sh"
	echo "Apakah Anda Ingin Mengatur Hak Akses Berkas (y/t)?"
	read atur

		if (( $atur == y ))
		then
			echo "Masukkan Nama Berkas ini:"
			read berkas
			echo "Masukkan Manipulasi Hak Akses Dengan Deretan 3Angka :"
			read deret

			sudo chmod $deret $berkas
			clear
		echo "Manipulasi Hak Akses Berkas $berkas Berhasil"
		ls -l
		fi

}

while :;
do	
	echo "1. Input Data Customer"
	echo "2. View Data Custumer"
	echo "3. Search Data Customer"
	echo "4. Manipulasi Hak Akses Program"
	echo "5. Buka Aplikasi Firefox"
	echo "6. Exit"

	echo "Masukkan Pilihan Menu :"
	read menu
clear
		if (( "$menu" == 1 ))
		then	
			input
			i=`expr $i + 1`
				if (( "$i">=2 ))
				then 
					for ((m=0; m<i-1; m++))
					do
						if(( "${noktp[$i-1]}" == "${noktp[m]}" ))
						then
							echo -e "\nNomor KTP ini sudah terdaftar!\nMasukan nomor yang lain!"
							read
							unset nama[$i-1]
							unset alamat[$i-1]
							unset nohp[$i-1]
							unset noktp[$i-1]
							unset kamera[$i-1]
							unset hari[$i-1]
							unset hitung[$i-1]
							i=`expr $i - 1`
							break
	   					fi
					done
				fi	
 	 	clear
							
		elif (( "$menu" == 2 ))
		then
			if (( "$i" == 0 ))
			then 
				echo "Tidak Terdapat Data Untuk Ditampilkan"
			else
				view
			fi
				read
				clear
		elif (( "$menu" == 3 ))
		then
			if (( "$i" == 0 ))
  			then
   				clear
   				echo "Tidak Terdapat Data Untuk Dicari"
   			else
				search
			fi 
				read
				clear
		elif (( "$menu" == 4 ))
		then
		clear
		read
			manipulasi

		elif (( "$menu" == 5 ))
		then
			aplikasi

		elif (( "$menu" != 1 && "$menu" != 2 && "$menu" != 3 && "$menu" != 4  && "$menu" != 5  && "$menu" != 6 ));    			
				then
  				echo "Pilihan Menu Tidak Valid"
  				read
  				clear
		elif (( "$menu" == 6 ))
		then
			exit
		fi

			
		

done





 





