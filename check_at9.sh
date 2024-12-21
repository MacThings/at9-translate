#!/bin/bash
#
# Es muss zuvor mit a9codec.exe (a9codec.exe -x BIN-Datei) die deutsche csvp.bin von der 
# Vorversion extrahiert werden. # Danach die orig. japanische von der aktuellen Version.
# Die Ordner sind wie folgt zu benennen: "csvp_jp" und "csvp_de".
# Dann im selben Pfad wo die 2 Ordner sind das check_at9.sh Script ausführen. Es werden
# dann pro Datei alle Strings gespeichert die in der deutschen Datei noch fehlen und
# ergänzt werden müssen. Die Dateien haben die Endung "_fehlt". Habt Ihr alles fertig so
# müsst Ihr die csvp nun neu erzeugen. Dazu den Ordner csvp_de zu csvp umbenennen und dann:
# "a9codec.exe -c csvp" ausführen. Dies wird eine Datei mit dem Namen csvp.bin_new anlegen.
# Diese zu csvp.bin umbenennen. Fertig.


files=("msg_sec" "gametext" "structure" "train_comment" "automobile_comment" "stock")

if ls *_fehlt 1> /dev/null 2>&1; then
    rm *_fehlt
fi

for file in "${files[@]}"; do

	csvp_jp="csvp_jp/data/$file.csv"
	csvp_de="csvp_de/data/$file.csv"

	iconv -f UTF-16LE -t UTF-8 "$csvp_jp" -o jp_"$file".csv
	iconv -f UTF-16LE -t UTF-8 "$csvp_de" -o de_"$file".csv

	cat jp_"$file".csv | grep -o 'MSG_[A-Za-z0-9_]*' > "$file"
	cat jp_"$file".csv | grep -o 'COMMENT_[A-Za-z0-9_]*' >> "$file"
	cat jp_"$file".csv | grep -o 'GUIDANCE_[A-Za-z0-9_]*' >> "$file"
	cat jp_"$file".csv | grep -o 'TEXT_[A-Za-z0-9_]*' >> "$file"
	cat jp_"$file".csv | grep -o 'BALLOON_[A-Za-z0-9_]*' >> "$file"
	cat jp_"$file".csv | grep -o 'FORM_[A-Za-z0-9_]*' >> "$file"
	cat jp_"$file".csv | grep -o 'STC_[A-Za-z0-9_]*' >> "$file"
	cat jp_"$file".csv | grep -o 'AUTOMOBILE_[A-Za-z0-9_]*' >> "$file"

	while read -r begriff; do
    	if ! grep -q "$begriff" de_"$file".csv; then
        	echo "'$begriff'" >> "$file"_fehlt
    	fi
	done < <( cat "$file" )

	rm jp_"$file".csv de_"$file".csv "$file"

done