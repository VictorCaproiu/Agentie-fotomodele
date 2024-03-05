-- 1.nume ang cu cea mai mare compensatie pe ora de lucru

SELECT DISTINCT A.Nume, A.Prenume
FROM Angajat A JOIN AngajatEveniment AE ON A.AngajatID = AE.AngajatID 
WHERE AE.Compensatie = (SELECT max(AE2.Compensatie) FROM AngajatEveniment AE2);

SELECT max(AE2.Compensatie) FROM AngajatEveniment AE2;

-- 2.nume prenume fotomodele cu marimea la pantof sub medie
SELECT A.Nume, A.Prenume
FROM Angajat A JOIN Fotomodel F ON A.FotomodelID = F.FotomodelID
WHERE F.MarimePantofi < (SELECT avg(F.MarimePantofi) FROM Fotomodel F);

-- 3.care e cea mai des intalnita culoare de par
SELECT DISTINCT F.CuloarePar
FROM Fotomodel F
WHERE F.CuloarePar IN 
(SELECT F.CuloarePar FROM Fotomodel F GROUP BY F.CuloarePar ORDER BY count(F.FotomodelID) DESC)
LIMIT 1;

-- 4.suma ore lucru angajat care e manager ord desc
SELECT A.Nume, A.Prenume, sum(AE.NrOreLucru) AS SumOre
FROM Angajat A JOIN AngajatEveniment AE ON A.AngajatID = AE.AngajatID
WHERE A.AngajatID IN (SELECT ManagerID FROM Departament)
GROUP BY A.AngajatID
ORDER BY sum(AE.NrOreLucru) DESC;