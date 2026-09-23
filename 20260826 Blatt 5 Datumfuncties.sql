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
SELECT TOP 10 Anreise AS Früh, MAX(Abreise) AS Spät
FROM tbl_buchungen;