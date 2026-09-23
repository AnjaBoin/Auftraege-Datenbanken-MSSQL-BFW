--Aufgabe 2.1 Aggregatfunktionen

-- a) Name und Geburtsdatum 10 älteste Kunden
SELECT TOP 10 Vorname + ' ' + Nachname AS Name, Geburtsdatum
FROM dbo.tbl_Adressen
ORDER BY Geburtsdatum;

-- b) Appartements aufsteigend 
SELECT AppartementNr, Preisgruppe
FROM tbl_Appartements
ORDER BY Preisgruppe, Größe DESC;

SELECT * 
FROM tbl_Appartements
ORDER BY Preisgruppe ASC, Größe DESC;

-- c) Kunden mit Nachname 5 BS
SELECT *
FROM tbl_Adressen
WHERE Nachname LIKE '_____'
ORDER BY Nachname ASC;

-- d) Appartements mit Sonderausstattung
SELECT * 
FROM tbl_Appartements
WHERE Sonderausstattung IS NOT NULL;

--AUFGABE 2.2

-- a) Menge Kunden geboren vor 1.1.1977
SELECT COUNT(*)
FROM tbl_Adressen
WHERE Geburtsdatum < '01-01-1977';

-- b) benötigte M2 Teppich
SELECT SUM(Größe)
FROM tbl_Appartements;

-- c) Anzahl App Grösse 28-32 oder 40-60 M2
SELECT COUNT(*)
FROM tbl_Appartements
WHERE (Größe <= 32 AND Größe >= 28)  OR (Größe <= 60 AND Größe >= 40);

SELECT COUNT(*)
FROM tbl_Appartements
WHERE (Größe BETWEEN 28 AND 32) OR (Größe BETWEEN 40 AND 60);

-- d) kleinkindgerecht und nach dem 1.1.1990 renoviert
SELECT COUNT(*)
FROM tbl_Appartements
WHERE Kleinkind = 'true' AND LetzteRen > '01-01-1990'; 