-- 1.cati angajati in fiecare dep
SELECT D.NumeDepartament AS Departament, count(A.AngajatID) AS Employees
FROM Angajat A JOIN Departament D ON A.DepartamentID = D.DepartamentID
GROUP BY D.DepartamentID;

-- 2.nume fotomodele ochi albastri
SELECT A.Nume, A.Prenume
FROM Angajat A JOIN Fotomodel F ON A.FotomodelID = F.FotomodelID
WHERE F.CuloareOchi = 'Albastri';

-- 3.top angajati dupa nr ore lucr
SELECT A.Nume, A.Prenume, sum(AJ.NrOreLucru)
FROM Angajat A JOIN AngajatEveniment AJ ON A.AngajatID = AJ.AngajatID
GROUP BY A.AngajatID
ORDER BY sum(AJ.NrOreLucru) DESC
LIMIT 5;

-- 4.nume even client
SELECT E.Titlu, C.Denumire 
FROM Eveniment E JOIN Clienti C ON E.ClientID = C.ClientID
ORDER BY E.DataEV DESC;

-- 5. nume si departament ultimii 5 angajati 
SELECT A.Nume, A.Prenume, D.NumeDepartament, A.DataAngajarii
FROM Angajat A JOIN Departament D ON A.DepartamentID = D.DepartamentID 
ORDER BY A.DataAngajarii DESC
LIMIT 5;

-- 6. date contanct manageri
SELECT A.Nume, A.Prenume, D.NumeDepartament, A.email, A.telefon
FROM Angajat A JOIN Departament D ON D.ManagerID = A.AngajatID; 
