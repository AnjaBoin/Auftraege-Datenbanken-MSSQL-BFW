-- Aufgabe 5.1

-- a) Wann war die letzte Abreise?

SELECT MAX(Abreise) AS LetzteAbreise 
From tbl_buchungen;

-- b) Letzte Renovierung in einem Monat (Tag Ausgabe)

SELECT MAX(LetzteRen) AS LetzteRenovierung 
From tbl_Appartements;


-- c) kleinste kleinkindgerechte App
SELECT MIN(Größe) AS KleinsteApp
FROM tbl_Appartements
WHERE Kleinkind = 'true';

-- d) 
-- dit werkt dus niet-(
--SELECT TOP 1 Anreise AS FrühesterZP, TOP 1 Abreise AS Spätester ZP;
--FROM tbl_buchungen
--ORDER BY Anreise, Abreise ;

SELECT TOP 1 MIN(MONTH(Anreise)) AS MinMonat, MIN(DAY(Anreise)) AS MinTag
FROM tbl_buchungen;

SELECT TOP 1 MAX(MONTH(Abreise)) AS MaxMonat, MAX(DAY(Abreise)) AS MaxTag
FROM tbl_buchungen;

-- Problem; nimmt maximaler Tag aber nicht maximaler Monat
SELECT MIN ( CONVERT (varchar(6), Anreise, 104)) AS Saisonbeginn, 
 MAX ( CONVERT (varchar(6), Abreise, 104)) AS SaisonEnde 
FROM tbl_buchungen; 

-- Deze code werkt:
SELECT MIN(RIGHT(CONVERT(varchar(6), Anreise, 12), 4)) AS Saisonbeginn, 
 MAX(RIGHT(CONVERT(varchar(6), Abreise, 12), 4)) AS Saisonende
FROM tbl_buchungen
WHERE BuchungsNr < 100;

-- Aufgabe 5.2
-- a) (es werden 4 Tage auf dem Tag gerechnet)
 SELECT Geburtsdatum, DATEADD(DAY, 4, Geburtsdatum) 
 FROM tbl_Adressen;

 -- b) 
 INSERT INTO tbl_Adressen (KundenNr, Vorname, Nachname, Geburtsdatum) VALUES
 ('Anja', 'Musterfrau', '28.02.2000'),
 ('Anja', 'Musterfrau 2', '28.02.2001');