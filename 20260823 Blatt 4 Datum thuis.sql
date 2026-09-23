-- Aufgabe 4.1

-- a) Selecteer Kunden tussen 24.10 en 22.11
SELECT Nachname, Vorname, Geburtsdatum
FROM tbl_Adressen
WHERE MONTH(Geburtsdatum) = 10 AND DAY(Geburtsdatum) >= 24
OR MONTH(Geburtsdatum) = 11 AND DAY(Geburtsdatum) <= 22;

-- b) Welke buchungen vallen in 1 t/m 15 van de maand, anreise en abreise?
SELECT BuchungsNr, Anreise, Abreise 
FROM tbl_buchungen
WHERE DAY(Anreise) BETWEEN 1 AND 15
AND DAY(Abreise) BETWEEN 1 AND 15;

-- c) Wie viele Kunden haben im Aug, Sept oder Okt Geburtstag
-- totale som Kunden
SELECT COUNT(*) AS AnzGebInAugSepOkt 
FROM tbl_Adressen
WHERE MONTH(Geburtsdatum) = '8' OR MONTH(Geburtsdatum) = '9' OR MONTH(Geburtsdatum) = '10';

-- Lösung mit IN
SELECT COUNT(*) AS AnzGebInAugSepOkt 
FROM tbl_Adressen
WHERE MONTH(Geburtsdatum) IN (8, 9, 10);

-- Lösung mit BETWEEN
SELECT COUNT(*) AS AnzGebInAugSepOkt 
FROM tbl_Adressen
WHERE MONTH(Geburtsdatum) BETWEEN 8 AND 10;

-- aantal gesorteerd per maand
SELECT MONTH(Geburtsdatum) AS Monat, COUNT(*) AS AnzahlGeburtstage
FROM tbl_Adressen
WHERE MONTH(Geburtsdatum) = '8' OR MONTH(Geburtsdatum) = '9' OR MONTH(Geburtsdatum) = '10'
GROUP BY MONTH(Geburtsdatum);

-- aantal gesorteerd per maand, maar dan korter genoteerd
SELECT MONTH(Geburtsdatum) AS Monat, COUNT(*) AS AnzahlGeburtstage
FROM tbl_Adressen
WHERE MONTH(Geburtsdatum) IN (8, 9, 10)
GROUP BY MONTH(Geburtsdatum);

-- d) hoeveel Kunden zijn in huidige maand jarig, geen LIKE gebruiken want dat is voor teksten
SELECT MONTH(Geburtsdatum) AS Monat, COUNT(*) AS AnzahlGeburtstage
FROM tbl_Adressen
WHERE MONTH(Geburtsdatum) = MONTH(getdate())
GROUP BY MONTH(Geburtsdatum);

-- e) Kunden die in heutige Monat Geburtstag haben ab heute, aufsteigend Nachname
SELECT Nachname, Vorname, MONTH(Geburtsdatum) AS HeutigeMonat, DAY(Geburtsdatum) AS GeburtstagAm
FROM tbl_Adressen
WHERE MONTH(Geburtsdatum) = MONTH(getdate()) AND DAY(Geburtsdatum) > DAY(getdate())
ORDER BY (Nachname) ASC;

-- f) Wie viele Kunden haben eine Schnappszahl als Geburtstag?
SELECT COUNT(*) AS AnzahlSchnappszahle
FROM tbl_Adressen
WHERE MONTH(Geburtsdatum) = DAY(Geburtsdatum);

-- g) Wie viele Kunden sind nich nicht volljärig
SELECT Nachname, Vorname, Geburtsdatum
FROM tbl_Adressen
WHERE YEAR(getdate()) - YEAR(Geburtsdatum) < 18
ORDER BY Nachname;
-- die Kunden, die eine Unterschied < 18 im Jahr haben, können trotzdem unterjärig sein, 
-- weil Monat und Tag nicht verglichen wurden


-- Syntax: DATEDIFF ( datepart , startdate , enddate )
SELECT Nachname, Vorname, Geburtsdatum, DATEDIFF(year, Geburtsdatum, getdate()) AS DiffInJahre
FROM tbl_Adressen
WHERE DATEDIFF(year, Geburtsdatum, getdate()) < 18
ORDER BY Nachname;

-- Syntax: DATEDADD ( eenheid , nummer optellen/aftrekken ,begindatum )
SELECT Nachname, Vorname, Geburtsdatum
FROM tbl_Adressen
WHERE DATEADD(year, 18, Geburtsdatum) > getdate()
ORDER BY Nachname;