from flask import render_template, request, redirect, session, flash
from flask_bcrypt import Bcrypt
from flask_app import app
from flask_app.models.user import User

bcrypt = Bcrypt(app)

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/register',methods=['POST'])
def register():
    is_valid = User.validate_user(request.form)
    if not is_valid:
        return redirect("/")
    
    new_user = {
        "name": request.form["name"],
        "alias": request.form["alias"],
        "email": request.form["email"],
        "password": bcrypt.generate_password_hash(request.form["password"]),
        "date_birth": request.form["date_birth"]
    }

    id = User.save(new_user)
    if not id:
        flash("Email already taken.","register")
        return redirect('/')
    
    session['user_id'] = id
    return redirect('/')

@app.route("/login",methods=['POST'])
def login():
    data = {
        "email": request.form['email']
    }
    user = User.get_by_email(data)

    if not user:
        flash("Invalid Email/Password","login")
        return redirect("/")
    if not bcrypt.check_password_hash(user.password,request.form['password']):
        flash("Invalid Email/Password","login")
        return redirect("/")
    
    session['user_id'] = user.id
    return redirect('/pokes')


@app.route('/logout')
def logout():
    session.clear()
    return redirect('/')