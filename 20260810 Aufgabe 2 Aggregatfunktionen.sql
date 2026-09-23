-- Aufgabe 2.1 a) 
SELECT TOP 10 Vorname, Nachname, Geburtsdatum
FROM dbo.tbl_Adressen
WHERE Geburtsdatum IS NOT NULL
ORDER BY Geburtsdatum;

-- Aufgabe 2.1 b)
SELECT * FROM tbl_Appartements
ORDER BY Preisgruppe, Größe DESC;

-- Aufgabe 2.1 c)
SELECT * FROM tbl_Adressen WHERE Nachname LIKE '_____'
ORDER BY Nachname;

-- Aufgabe 2.1 d)
SELECT * FROM tbl_Appartements 
WHERE Sonderausstattung IS NOT NULL;
-- WHERE Sonderausstattung LIKE '%';

-- Aufgabe 2.2
SELECT AVG(Größe) FROM tbl_Appartements;

-- Uitleg Hüllen over sorteren op woonplaats
SELECT Ort, COUNT(*) FROM tbl_Adressen
GROUP BY Ort;

-- Aufgabe 2.2 a)
SELECT Geburtsdatum, COUNT(*)
FROM dbo.tbl_Adressen
WHERE Geburtsdatum < '1977-01-01';
