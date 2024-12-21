# at9-translate

Deutsche Sprachdatei für A-Train 9v5.

Erstellung einer neuern csvp.bin nach einem Update:
 
Es muss zuvor csvp.bin der deutschen Vorversion extrahiert werden:
```
a9codec.exe -x csvp.bin
mv csvp csvp_de
```
Danach die der japanischen neuen Version:
```
a9codec.exe -x csvp.bin
mv csvp csvp_jp
```

Dann im selben Pfad wo die 2 Ordner sind das 
check_at9.sh Script ausführen. 
```
/bin/bash check_at9.sh 
```
Es werden dann pro Datei alle Strings gespeichert die in der deutschen Datei (im Ordner csvp_de/data) noch fehlen und ergänzt werden müssen. Die Dateien haben die Endung "_fehlt".
Habt Ihr alles fertig so müsst Ihr die csvp nun neu erzeugen.
```
mv cvsp_de cvsp
a9codec.exe -c csvp
```
Dies wird eine Datei mit dem Namen csvp.bin_new anlegen. Diese zu csvp.bin umbenennen.

Fertig.
