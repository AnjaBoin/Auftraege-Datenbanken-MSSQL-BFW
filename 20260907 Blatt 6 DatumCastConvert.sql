-- Aufgabe 6.1
-- a) Wie viele Anreisen gab es in den letzten sechs Monaten? 

SELECT COUNT(Anreise) AS AnzahlAnreisenIn6Mon
FROM tbl_buchungen
WHERE Anreise < DATEADD(MONTH, -6 , '21.10.2018');

SELECT COUNT(Anreise) AS AnzahlAnreisenIn6Mon
FROM tbl_buchungen
WHERE Anreise BETWEEN '21.04.2018' AND '21.10.2018';

-- b) Wie viele Aufenthalte dauerten länger als 10 Tage?
SELECT COUNT (*) AS AufenthalteUeber10Tage
FROM tbl_buchungen
WHERE DATEDIFF(DAY, Anreise, Abreise) > 10;

-- c) Wie lang war der durchschnittliche Aufenthalt in 2017?
SELECT AVG(DATEDIFF(DAY, Anreise, Abreise))
FROM tbl_buchungen
WHERE YEAR(Abreise) = '2019';

-- d) Wie alt ist das älteste und das jüngste Familienmitglied der Familie Butz (in Jahren)?
SELECT MAX(Geburtsdatum) AS ÄltesteButz, MIN(Geburtsdatum) AS JüngsteButz
FROM tbl_Adressen
WHERE Nachname LIKE 'Butz';

-- e) Wie viele Kunden waren 2017 (2018) im Hotel
SELECT COUNT (*)
FROM tbl_buchungen
WHERE YEAR(Abreise) = '2019' OR YEAR(Anreise) = '2019';

-- Aufgabe 6.2
-- a) selecteer geburtstag am 23. Januar
SELECT Nachname, vorname, CAST(Geburtsdatum AS varchar(6)) AS Geburtsdatum
FROM tbl_Adressen
WHERE Geburtsdatum IS NOT NULL AND Geburtsdatum LIKE 'JAN 23%';

-- b) abfrage mit Anreise und Abreise ohne Jahreszahl
SELECT CAST(Anreise AS varchar(6)) AS Anreise, CAST(Abreise AS varchar(6)) AS Abreise
FROM tbl_buchungen;

SELECT CONVERT(varchar(6), Anreise, 104) AS Anreise, CONVERT(varchar(6), Abreise, 104) AS Abreise
FROM tbl_buchungen;

-- c) 
SELECT MIN(CONVERT(varchar(6), Anreise, 104)) AS MinAnreise, MIN(CONVERT(varchar(6), Abreise, 104)) AS MinAbreise
FROM tbl_buchungen;

SELECT CONVERT(varchar(6), MIN(Anreise), 104) AS MinMinAnreise, CONVERT(varchar(6), MIN(Abreise), 104) AS MinMinAbreise
FROM tbl_buchungen;

SELECT MAX(CONVERT(varchar(6), Anreise, 104)) AS MaxAnreise, MAX(CONVERT(varchar(6), Abreise, 104)) AS MaxAbreise
FROM tbl_buchungen;

SELECT CONVERT(varchar(6), MAX(Anreise), 104) AS MaxMaxAnreise, CONVERT(varchar(6), MAX(Abreise), 104) AS MaxMaxAbreise
FROM tbl_buchungen;

-- Aufgabe 6.3
-- a) 
-- Abfrage 1-a (in totaal 54 namen)
SELECT Nachname FROM tbl_Adressen;
-- Anfrage 1-b ( in totaal 36 namen; dubbele namen zijn eruit gefilterd)
SELECT DISTINCT Nachname FROM tbl_Adressen;
-- Abfrage 2-a
Select Vorname, Nachname FROM tbl_Adressen ORDER BY Nachname;
-- Abfrage 2-b (2 namen verwijderd, die met dezelfde voor- en achternaam)
Select DISTINCT Vorname, Nachname FROM tbl_Adressen ORDER BY Nachname; 

-- b) Wie viele verschiedene Nachnamen haben die Kunden? 36
SELECT COUNT(DISTINCT Nachname)
FROM tbl_Adressen;

-- c) An wie vielen verschiedenen Tagen in 20XX gab es eine Abreise? 
SELECT COUNT(DISTINCT Abreise) AS BuchungenAnVerschTagen
FROM tbl_buchungen
WHERE YEAR(Abreise) = '2018';

-- d) 
SELECT * from tbl_Adressen WHERE Nachname like 'N%'; 
SELECT * from tbl_Adressen WHERE Geburtsdatum < '01.01.1985'; 

-- e)
SELECT Nachname, Geburtsdatum from tbl_Adressen 
WHERE Nachname like 'N%'; 
SELECT Geburtsdatum, Nachname from tbl_Adressen 
WHERE Geburtsdatum < '01.01.1985'; 