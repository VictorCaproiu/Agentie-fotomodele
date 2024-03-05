from flask import Flask, render_template, request, session, redirect, url_for
import mysql.connector

conn = mysql.connector.connect(host="localhost",port="3306",user="root",password="root",database="agentie_foto",autocommit=True)
cursor = conn.cursor()

app = Flask(__name__)
app.secret_key = "super secret key"

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/home",methods=['GET','POST'])
def home():
    msg = ''

    cursor.execute(f"SELECT * FROM Angajat WHERE AngajatId = {session['id']}")
    record = cursor.fetchone()
    return render_template("home.html",data=msg)

@app.route("/info",methods=['GET','POST'])
def info():
    data = []
    # 1.cati angajati in fiecare dep 
    cursor.execute(f"""
                   SELECT D.NumeDepartament AS Departament, count(A.AngajatID) AS Employees
                    FROM Angajat A JOIN Departament D ON A.DepartamentID = D.DepartamentID
                    GROUP BY D.DepartamentID;
                   """)
    data.append(cursor.fetchall())

    # 2.nume fotomodele cu ochi albastri
    
    if 'sel_col' in request.form.keys():
        sel_col = request.form['sel_col']
        cursor.execute(f"""
                    SELECT A.Nume, A.Prenume
                        FROM Angajat A JOIN Fotomodel F ON A.FotomodelID = F.FotomodelID
                        WHERE F.CuloareOchi = '{sel_col}';
                    """)
        data.append(cursor.fetchall())
    else:
        data.append([])

    # 3.top angajati dupa nr ore lucrate
    cursor.execute(f"""
                   SELECT A.Nume, A.Prenume, sum(AJ.NrOreLucru)
                    FROM Angajat A JOIN AngajatEveniment AJ ON A.AngajatID = AJ.AngajatID
                    GROUP BY A.AngajatID
                    ORDER BY sum(AJ.NrOreLucru) DESC
                    LIMIT 5;
                   """)
    data.append(cursor.fetchall())

    # 4.nume eveniment si client
    cursor.execute(f"""
                   SELECT E.Titlu, C.Denumire 
                    FROM Eveniment E JOIN Clienti C ON E.ClientID = C.ClientID
                    ORDER BY E.DataEV DESC;
                   """)
    data.append(cursor.fetchall())

    # 5.cei mai recent 5 angajati
    cursor.execute(f"""
                   SELECT A.Nume, A.Prenume, D.NumeDepartament, A.DataAngajarii
                    FROM Angajat A JOIN Departament D ON A.DepartamentID = D.DepartamentID 
                    ORDER BY A.DataAngajarii DESC
                    LIMIT 5;
                   """)
    data.append(cursor.fetchall())

    # 6.date contact manageri
    cursor.execute(f"""
                   SELECT A.Nume, A.Prenume, D.NumeDepartament, A.email, A.telefon
                    FROM Angajat A JOIN Departament D ON D.ManagerID = A.AngajatID; 
                   """)
    data.append(cursor.fetchall())

    # ======================= Interogari complexe ==================================
    
    # 7.nume ang cu cea mai mare compensatie pe ora de lucru
    cursor.execute(f"""
                   SELECT DISTINCT A.Nume, A.Prenume
                    FROM Angajat A JOIN AngajatEveniment AE ON A.AngajatID = AE.AngajatID 
                    WHERE AE.Compensatie = (SELECT max(AE2.Compensatie) FROM AngajatEveniment AE2);
                   """)
    data.append(cursor.fetchall())

    # 8.numele si prenuemele fotomodelelor cu marimea selectata sub medie

    if 'sel_size' in request.form.keys():
        marime = request.form['sel_size']
        cursor.execute(f"""
                    SELECT A.Nume, A.Prenume
                        FROM Angajat A JOIN Fotomodel F ON A.FotomodelID = F.FotomodelID
                        WHERE F.{marime} < (SELECT avg(F.{marime}) FROM Fotomodel F);
                    """)
        data.append(cursor.fetchall())
    else:
        data.append([])
    
    # 9.care e cea mai des intalnita culoare de par
    cursor.execute(f"""
                   SELECT DISTINCT F.CuloarePar
                    FROM Fotomodel F
                    WHERE F.CuloarePar IN 
                    (SELECT F.CuloarePar FROM Fotomodel F GROUP BY F.CuloarePar ORDER BY count(F.FotomodelID) DESC)
                    LIMIT 1;
                   """)
    data.append(cursor.fetchall())
    
    # 10.suma orelor de lucru al fiecarul manager ord descrescator
    cursor.execute(f"""
                   SELECT A.Nume, A.Prenume, sum(AE.NrOreLucru) AS SumOre
                    FROM Angajat A JOIN AngajatEveniment AE ON A.AngajatID = AE.AngajatID
                    WHERE A.AngajatID IN (SELECT ManagerID FROM Departament)
                    GROUP BY A.AngajatID
                    ORDER BY sum(AE.NrOreLucru) DESC;
                   """)
    data.append(cursor.fetchall())
    
    return render_template("info.html",data=data)


@app.route("/chg_pwd",methods=['GET','POST'])
def chg_pwd():
    msg = ''
    new_password = request.form['new_pass']

    cursor.execute(f"SELECT Parola FROM Angajat WHERE AngajatId = {session['id']} ")
    record = cursor.fetchone()[0]

    if record == new_password:
        msg = 'The new password cannot be the same as the old one!'
    else:
        cursor.execute(f"UPDATE Angajat SET Parola='{new_password}' WHERE AngajatId = {session['id']}")
        msg = 'Your password has been succesfully been reset!'
    
    return render_template("home.html",data=msg)

@app.route("/chg_attr",methods=['GET','POST'])
def chg_attr():
    msg = ''

    attribute = request.form['attribute']
    new_attr = request.form['new_attr']

    cursor.execute(f"UPDATE Angajat SET {attribute}='{new_attr}' WHERE AngajatID = {session['id']}")
    msg = f'\"{attribute}\" has been succesfully updated!'

    if attribute == 'Prenume':
        session['first_name'] = new_attr

    return render_template("home.html",data=msg)

@app.route("/chg_even",methods=['GET','POST'])
def chg_even():
    msg = ''

    if request.method == 'POST':
        title = request.form['title']
        date = request.form['date']
        loc = request.form['location']
        coordid = request.form['coordonator']

        cursor.execute(f"INSERT INTO Eveniment (Titlu, DataEv, Locatie, CoordonatorID)\
                            VALUES ('{title}','{date}','{loc}', '{coordid}');")
        msg = 'The event has been added!'
    
    return render_template("home.html",msg=msg)

@app.route("/del_even",methods=['GET','POST'])
def del_even():
    cursor.execute(f"SELECT EvenimentID FROM Eveniment WHERE Titlu='{request.form['title']}'")
    record = cursor.fetchone()[0]
    
    cursor.execute(f"DELETE FROM Eveniment WHERE EvenimentID={record}")
    msg = 'The event has been deleted!'

    return render_template("home.html",data=msg)

@app.route("/login",methods=['GET','POST'])
def login():
    msg=''
    
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        cursor.execute(f"SELECT * FROM Angajat WHERE Email='{email}' AND Parola='{password}'")
        record = cursor.fetchone()

        if record:
            session['loggedin'] = True
            session['id'] = record[0]
            session['first_name'] = record[3]
            session['manager'] = False

            cursor.execute(f"SELECT * FROM Departament WHERE ManagerID = '{session['id']}' ")
            record = cursor.fetchone()
            if record:
                session['manager'] = True

            return redirect(url_for('home'))
        else:
            msg = 'Incorrect email/password. Try again!'
        
    return render_template("index.html",msg=msg)

@app.route("/register",methods=['GET','POST'])
def register():
    msg=''
    if request.method == 'POST':
        nume = request.form['nume']
        prenume = request.form['prenume']
        email = request.form['email']
        password = request.form['password']
        password2 = request.form['confirm_pass']

        if password != password2:
            msg = 'The passwords don\'t match!'
            return render_template("index.html",msg=msg)

        cursor.execute(f"SELECT Prenume FROM Angajat WHERE Email='{email}'")
        record = cursor.fetchone()

        if record:
            msg = 'The email you submited is already registered.'
        else:
            cursor.execute(f"INSERT INTO Angajat (Nume, Prenume, Email, Parola)\
                             VALUES ('{nume}','{prenume}','{email}', '{password}');")
            msg = 'Your account has been created!'
    return render_template("index.html",msg=msg)

@app.route("/logout")
def logout():
    session.pop('loggedin',None)
    session.pop('email',None)
    session.pop('id',None)
    session.pop('first_name',None)
    return redirect(url_for('index'))

@app.route("/delete_acc")
def delete_acc():
    cursor.execute(f"DELETE FROM Angajat WHERE AngajatID={session['id']}")
    return logout()

if __name__ == "__main__":
    app.run(debug=True)