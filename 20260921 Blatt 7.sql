USE Ferienclub;

-- Aufgabe 7.1
-- a) Appartments vom Oskar Null ausgeben, App Nr, Größe, Aufenthaltsdauer (Tage)
SELECT Adr.Vorname + ' ' + Adr.Nachname AS Kunde, Apt.AppartementNr, Apt.Größe, DATEDIFF(DAY, Buc.Anreise, Buc.Abreise) AS Aufenthaltsdauer
FROM tbl_Adressen AS Adr
INNER JOIN tbl_buchungen AS Buc
ON Adr.KundenNr = Buc.KundenNr

INNER JOIN tbl_Appartements AS Apt
ON Buc.Appartement = Apt.AppartementNr
WHERE Nachname = 'Null' AND Vorname = 'Oskar';

-- b) Kunde ausgeben der am 24.06.2019 im Ferienclub war
SELECT adr.Vorname + ' ' + adr.Nachname AS Kunde, buc.Appartement, CONVERT(varchar(10), buc.Anreise, 104) AS Anreisedatum, CONVERT(varchar(10), buc.Abreise, 104) AS Abreisedatum
FROM tbl_Adressen AS adr
INNER JOIN tbl_buchungen AS buc
ON adr.KundenNr = buc.KundenNr
WHERE Anreise <= '24.06.2019' AND Abreise >= '24.06.2019';

-- c) Wie oft wurde Apt 23 gebucht?
SELECT COUNT(*) AS AnzahlMaleGebucht
FROM tbl_buchungen
WHERE Appartement = 23;

-- d) Wie oft Apt größer als 40 m2 gebucht
SELECT COUNT(*) AS AnzahlAptGrößer40
FROM tbl_buchungen AS buc
INNER JOIN tbl_Appartements AS apt
ON buc.Appartement = apt.AppartementNr
WHERE apt.Größe > 40;

-- e) Frau Haupter, größter App ausgeben
SELECT TOP 1 apt.AppartementNr, Apt.Größe, Adr.Anrede + ' ' + Adr.Nachname AS Kunde
FROM tbl_Adressen AS Adr
INNER JOIN tbl_buchungen AS Buc
ON Adr.KundenNr = Buc.KundenNr

INNER JOIN tbl_Appartements AS Apt
ON Buc.Appartement = Apt.AppartementNr
WHERE Nachname = 'Haupter' AND Anrede = 'Frau'
ORDER BY Apt.Größe DESC;

-- f) Umsatz ausgeben vom Frau Petra Klein
SELECT adr.Nachname, adr.Vorname, 
(DATEDIFF(DAY, Anreise, Abreise) / 7) * pre.PreisProWoche + ((DATEDIFF(DAY, Anreise, Abreise) % 7) * pre.PreisProTag) AS Umsatz
FROM tbl_Adressen AS adr
INNER JOIN tbl_buchungen AS buc
ON adr.KundenNr = buc.KundenNr
INNER JOIN tbl_Appartements AS app
ON buc.Appartement = app.AppartementNr
INNER JOIN tbl_preisgruppe AS pre
ON app.Preisgruppe = pre.Preisgruppe
WHERE adr.Nachname = 'Klein';

-- g) Gesamt-Umsatz Apps Preisgruppe 2
SELECT app.Preisgruppe, app.AppartementNr,
(DATEDIFF(DAY, Anreise, Abreise) / 7) * pre.PreisProWoche + ((DATEDIFF(DAY, Anreise, Abreise) % 7) * pre.PreisProTag) AS Umsatz
FROM tbl_Adressen AS adr
INNER JOIN tbl_buchungen AS buc
ON adr.KundenNr = buc.KundenNr
INNER JOIN tbl_Appartements AS app
ON buc.Appartement = app.AppartementNr
INNER JOIN tbl_preisgruppe AS pre
ON app.Preisgruppe = pre.Preisgruppe
WHERE app.Preisgruppe = 2 AND YEAR(Anreise) = 2019;

-- SUMME mit Wochenberücksichtigung
SELECT SUM(
(DATEDIFF(DAY, Anreise, Abreise) / 7) * pre.PreisProWoche + 
(DATEDIFF(DAY, Anreise, Abreise) % 7) * pre.PreisProTag) AS Umsatz
FROM tbl_Adressen AS adr
INNER JOIN tbl_buchungen AS buc
ON adr.KundenNr = buc.KundenNr
INNER JOIN tbl_Appartements AS app
ON buc.Appartement = app.AppartementNr
INNER JOIN tbl_preisgruppe AS pre
ON app.Preisgruppe = pre.Preisgruppe
WHERE app.Preisgruppe = 2 AND YEAR(Anreise) = 2018;

-- Summe mit nur PreisProTag
SELECT SUM(
(DATEDIFF(DAY, Anreise, Abreise)) * pre.PreisProWoche) AS Umsatz
FROM tbl_Adressen AS adr
INNER JOIN tbl_buchungen AS buc
ON adr.KundenNr = buc.KundenNr
INNER JOIN tbl_Appartements AS app
ON buc.Appartement = app.AppartementNr
INNER JOIN tbl_preisgruppe AS pre
ON app.Preisgruppe = pre.Preisgruppe
WHERE app.Preisgruppe = 2 AND YEAR(Anreise) = 2018;

-- Zusatsaufgabe Kunden aus demselben Ort
-- KundenNr, Vorname, Nachname, Ort, 
-- Klaus peter monching
SELECT KundenNr, Vorname, Nachname, Ort
FROM tbl_Adressen
ORDER BY (Ort);