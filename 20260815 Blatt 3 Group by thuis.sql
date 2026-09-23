-- Aufgabe Blatt 3 Group By

-- Aufgabe 3.1
-- a)
SELECT Preisgruppe, SUM(Preisgruppe) AS TeppichBenötigt
FROM tbl_Appartements
GROUP BY Preisgruppe;

-- b)
SELECT Ort, COUNT(Ort) AS AnzahlKunden
FROM tbl_Adressen
GROUP BY ORT;

-- c)
SELECT Preisgruppe, MAX(Größe) AS GrössteApp, MIN(Größe) AS KleinsteApp
FROM tbl_Appartements
GROUP BY Preisgruppe;

-- d)
SELECT MAX(Count(*)), KundenNr
FROM tbl_buchungen
GROUP BY KundenNr;
-- werkt niet omdat je geen geneste agregaatfuncties mag gebruiken

SELECT MAX(SUM(KundenNr)), KundenNr
FROM tbl_buchungen
GROUP BY KundenNr;
-- werkt niet omdat je geen geneste agregaatfuncties mag gebruiken

SELECT TOP 1 KundenNr, COUNT(*) AS AnzahlBuchungen
FROM tbl_buchungen
GROUP BY KundenNr
ORDER BY AnzahlBuchungen DESC;

-- Aufgabe 3.2 GROUP BY mit 1 Tabelle; Filtern

-- a) durschnittliche Grösse der Apps
SELECT Preisgruppe, AVG(Größe) AS Durchschnitt
FROM tbl_Appartements
WHERE Lagebeschreibung = 'erster Stock'
GROUP BY Preisgruppe;

-- b) Kunden zählen
SELECT Ort, COUNT(Ort) AS AnzahlKunden
FROM tbl_Adressen
WHERE Geburtsdatum > '20021231'
GROUP BY ORT;

-- c) Anzahl App mehr als 1 Schlafzimmer
SELECT Preisgruppe, COUNT(*) AS AnzahlAppMehrAls1Schlafzimmer
FROM tbl_Appartements
WHERE Schlafzimmernazahl > 1
GROUP BY Preisgruppe;

-- d) Anzahl Kunden aus NRW
SELECT Vorname, COUNT(Vorname) AS Anzahl
FROM tbl_Adressen
WHERE PLZ LIKE '4%'
GROUP BY Vorname;

