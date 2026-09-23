use Ferienclub;

-- Aufgabe 1a
SELECT 
	Preisgruppe, 
	PreisProTag * 7 AS PreisProTag_mal_7, 
	PreisProWoche
FROM dbo.tbl_preisgruppe;

-- Aufgabe 1b

SELECT 
	Preisgruppe, 
	PreisproTag AS PreisProTag_brutto, 
	--PreisProTag / 1.19 AS PreisProTag_netto
	-- cast(PreisProTag*1.19 AS Decimal(10,2))
	FORMAT(PreisProTag / 1.19, 'N2')
FROM dbo.tbl_preisgruppe;

-- Aufgabe 1c
SELECT 
	Schlafzimmernazahl, 
	MaxBelegung,  
	MaxBelegung % Schlafzimmernazahl AS PlatzCouch
FROM tbl_Appartements 
WHERE Schlafzimmernazahl > 0; 

-- Aufgabe 2a
SELECT 
	Vorname + ', ' + Nachname AS Kunden
FROM dbo.tbl_Adressen;

-- Aufgabe 2b
SELECT
	AppartementNr, Größe / MaxBelegung AS Qm
FROM dbo.tbl_Appartements;