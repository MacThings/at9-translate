# at9-translate

Deutsche Sprachdatei für A-Train 9v5.

Es muss zuvor mit a9codec.exe (a9codec.exe -x BIN-Datei) die deutsche csvp.bin von der 
Vorversion extrahiert werden. # Danach die orig. japanische von der aktuellen Version.
Die Ordner sind wie folgt zu benennen: "csvp_jp" und "csvp_de".
Dann im selben Pfad wo die 2 Ordner sind das check_at9.sh Script ausführen. Es werden
dann pro Datei alle Strings gespeichert die in der deutschen Datei noch fehlen und
ergänzt werden müssen. Die Dateien haben die Endung "_fehlt". Habt Ihr alles fertig so
müsst Ihr die csvp nun neu erzeugen. Dazu den Ordner csvp_de zu csvp umbenennen und dann:
"a9codec.exe -c csvp" ausführen. Dies wird eine Datei mit dem Namen csvp.bin_new anlegen.
Diese zu csvp.bin umbenennen. Fertig.