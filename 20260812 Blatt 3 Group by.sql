-- Aufgabenblatt 3

-- Aufgabe 3.1 Group By mit 1 Tabelle
-- a) Aantal quadraatmeters per Prijsgroep laten optellen
SELECT Preisgruppe, SUM(Größe) AS Summe_Qm2 FROM tbl_Appartements GROUP BY Preisgruppe;

-- b) Steden met aantal klanten
SELECT Ort, COUNT(Ort) AS Anzahl FROM tbl_Adressen GROUP BY Ort;

-- c) Hoe groot is het kleinste en grootste appartement
SELECT MAX(COUNT(Größe)) AS Max, MIN(COUNT(Größe)) AS Min FROM tbl_Appartements GROUP BY Größe ORDER BY Größe;
-- Preisgruppe, AppartementNr,
-- d)
SELECT MAX(COUNT(*)), Kundennr FROM tbl_buchungen GROUP BY KundenNr;