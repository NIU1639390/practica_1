#!/bin/bash
i=$1
awk -F"," -v buscar="$i" '$1 ~ buscar' CAvideos.csv > CAvideosB.csv
awk -F"," -v buscar="$i" '$3 ~ buscar' CAvideos.csv > CAvideosB2.csv
a1=CAvideosB.csv
a2=CAvideosB2.csv
if [ "$#" != 0 ]; then
	if [ -s "$a1" ]; then
		echo "video id:" 
		cat CAvideosB.csv| awk -v FS=',' '{print $1}'| head -2 | tail -n 1
		echo
		echo "Trending date:"
		cat CAvideosB.csv| awk -v FS=',' '{print $2}'| head -2 | tail -n 1
		echo
		echo "Title:"
		cat CAvideosB.csv| awk -v FS=',' '{print $3}'| head -2 | tail -n 1
		echo
		echo "Channel title:"
		cat CAvideosB.csv| awk -v FS=',' '{print $4}'| head -2 | tail -n 1
		echo
		echo "Category id:"
		cat CAvideosB.csv| awk -v FS=',' '{print $5}'| head -2 | tail -n 1
		echo
		echo "Publish time:"
		cat CAvideosB.csv| awk -v FS=',' '{print $6}'| head -2 | tail -n 1
		echo
		echo "Tags:"
		cat CAvideosB.csv| awk -v FS=',' '{print $7}'| head -2 | tail -n 1
		echo
		echo "Views:"
		cat CAvideosB.csv| awk -v FS=',' '{print $8}'| head -2 | tail -n 1
		echo
		echo "Likes:"
		cat CAvideosB.csv| awk -v FS=',' '{print $9}'| head -2 | tail -n 1
		echo
		echo "Dislikes:" 
		cat CAvideosB.csv| awk -v FS=',' '{print $10}'| head -2 | tail -n 1
		echo
		echo "Comment count:"
		cat CAvideosB.csv| awk -v FS=',' '{print $11}'| head -2 | tail -n 1
		echo
		echo "Thumbnail_link:"
		cat CAvideosB.csv| awk -v FS=',' '{print $12}'| head -2 | tail -n 1
		echo
		echo "Comments dissabled:"
		cat CAvideosB.csv| awk -v FS=',' '{print $13}'| head -2 | tail -n 1
		echo
		echo "Rating dissabled:"
		cat CAvideosB.csv| awk -v FS=',' '{print $14}'| head -2 | tail -n 1
		echo
		echo "Video error:"
		cat CAvideosB.csv| awk -v FS=',' '{print $15}'| head -2 | tail -n 1
		echo
		echo "Description:"
		cat CAvideosB.csv| awk -v FS=',' '{print $16}'| head -2 | tail -n 1
		echo
	elif [ -s "$a2" ]; then
		echo "video id:" 
		cat CAvideosB2.csv| awk -v FS=',' '{print $1}'| head -2 | tail -n 1
		echo
		echo "Trending date:"
		cat CAvideosB2.csv| awk -v FS=',' '{print $2}'| head -2 | tail -n 1
		echo
		echo "Title:"
		cat CAvideosB2.csv| awk -v FS=',' '{print $3}'| head -2 | tail -n 1
		echo
		echo "Channel title:"
		cat CAvideosB2.csv| awk -v FS=',' '{print $4}'| head -2 | tail -n 1
		echo
		echo "Category id:"
		cat CAvideosB2.csv| awk -v FS=',' '{print $5}'| head -2 | tail -n 1
		echo
		echo "Publish time:"
		cat CAvideosB2.csv| awk -v FS=',' '{print $6}'| head -2 | tail -n 1
		echo
		echo "Tags:"
		cat CAvideosB2.csv| awk -v FS=',' '{print $7}'| head -2 | tail -n 1
		echo
		echo "Views:"
		cat CAvideosB2.csv| awk -v FS=',' '{print $8}'| head -2 | tail -n 1
		echo
		echo "Likes:"
		cat CAvideosB2.csv| awk -v FS=',' '{print $9}'| head -2 | tail -n 1
		echo
		echo "Dislikes:" 
		cat CAvideosB2.csv| awk -v FS=',' '{print $10}'| head -2 | tail -n 1
		echo
		echo "Comment count:"
		cat CAvideosB2.csv| awk -v FS=',' '{print $11}'| head -2 | tail -n 1
		echo
		echo "Thumbnail_link:"
		cat CAvideosB2.csv| awk -v FS=',' '{print $12}'| head -2 | tail -n 1
		echo
		echo "Comments dissabled:"
		cat CAvideosB2.csv| awk -v FS=',' '{print $13}'| head -2 | tail -n 1
		echo
		echo "Rating dissabled:"
		cat CAvideosB2.csv| awk -v FS=',' '{print $14}'| head -2 | tail -n 1
		echo
		echo "Video error:"
		cat CAvideosB2.csv awk -v FS=',' '{print $15}'| head -2 | tail -n 1
		echo
		echo "Description:"
		cat CAvideosB2.csv| awk -v FS=',' '{print $16}'| head -2 | tail -n 1
		echo
	else
		echo "No s'han trobat coincidències."
	fi
fi

if [ "$#" == 0 ]; then
	cut -d , -f 1,2,3,4,5,6,7,8,9,10,11,13,14,15 CAvideos.csv > CAvideos1.csv

	awk -F , 'NR==1 || $12== "True"|| $12=="False"'   CAvideos1.csv  > CAvideos2.csv
	awk -F , 'NR==1 || $13== "True"|| $13=="False"'   CAvideos2.csv  > CAvideos3.csv
	awk -F , 'NR==1 || $14== "True"|| $14=="False"'   CAvideos3.csv  > CAvideos4.csv

	awk -F , 'NR==1 || $14=="False"'   CAvideos4.csv  > CAvideos5.csv

	awk -F"," '{OFS=FS}{ if ($8 <= 1000000) $15="Bueno"; else if ($8=="views") $15="Ranking_Views"; else if ($8 > 10000000) $15="Estrella"; else $15="Excelente";print}' CAvideos5.csv>CAvideos6.csv

	awk 'BEGIN{FS=OFS=","} {AKA="%"} {if (NR==1) print $0 OFS "Rlikes"} {if (NR!=1) (resultat=($9*100)/$8)} {if (NR!=1) print $0 OFS resultat AKA}' CAvideos6.csv > CAvideos7.csv
	awk 'BEGIN{FS=OFS=","} {AKA="%"} {if (NR==1) print $0 OFS "Rdislikes"} {if (NR!=1) (resultat=($10*100)/$8)} {if (NR!=1) print $0 OFS resultat AKA}' CAvideos7.csv > CAvideosFINAL.csv
fi	
