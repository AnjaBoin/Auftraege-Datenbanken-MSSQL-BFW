-- Aufgabe 1a)
-- Wie viel Apps wurden von 1992-2000 gebaut?
SELECT COUNT(*) as AnzahlGebaut
FROM tbl_Appartements
WHERE Baujahr BETWEEN '1992' AND '2000';

-- Aufgabe 1b)
--wie viel verschiedene Grössen wurden gebaut?
SELECT COUNT( DISTINCT Größe) AS AnzahlVerschGrößen
FROM tbl_Appartements;

-- Aufgabe 2)
-- PLZ aufsteigend sortieren ohne Doppelungen
SELECT DISTINCT(PLZ), Ort AS Stadt
FROM tbl_Adressen
WHERE (PLZ) IS NOT NULL
ORDER BY (PLZ) ASC;

-- Aufgabe 3)
-- Wie viele Jahrgänge gibt es bei den Kunden?
SELECT DISTINCT YEAR(Geburtsdatum) AS VerschJahrgänge
FROM tbl_Adressen
WHERE (Geburtsdatum) IS NOT NULL;

-- Aufgabe 4)
-- Wie teuer ist ein App Pro Tag? MIjn oplossing is fout want die heeft het AVG van de standaard tabel.
SELECT AVG (PreisProTag) AS DurchschnittProTag 
FROM tbl_preisgruppe
WHERE (PreisProTag) IS NOT NULL;

SELECT *
FROM tbl_Appartements AS App
INNER JOIN tbl_Preisgruppe AS PG
ON App.Preisgruppe = PG.Preisgruppe;

SELECT AVG(PG.PreisProTag) AS Durchschnitt
FROM tbl_Appartements AS App
INNER JOIN tbl_Preisgruppe AS PG
ON App.Preisgruppe = PG.Preisgruppe
WHERE (PreisProTag) IS NOT NULL;

-- Aufgabe 5)
