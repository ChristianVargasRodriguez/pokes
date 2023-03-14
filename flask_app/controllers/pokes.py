from flask import render_template, request, redirect, session, flash
from flask_app.models.poke import Poke
from flask_bcrypt import Bcrypt
from flask_app import app
from flask_app.models.user import User
from ast import dump


@app.route('/pokes')
def pokes():
    if "user_id" not in session:
        return redirect("/")
    data = {"id": session["user_id"]}
    user = User.get_one(data)
    
    pokes = Poke.get_all()
    users = User.get_all()
    
    
    poked_by_users = {}

    for poke in pokes:
        poked_by_user = users[str(poke['poked_by_user_id'])]
        poked_user = users[str(poke['poked_user_id'])]
        
        if poked_user.id == user.id:
            #me están pokeando
            if str(poked_by_user.id) in poked_by_users:
                # Si el usuario que pokea existe en memoria
                times = poked_by_users[str(poked_by_user.id)]['times'] + 1
                name = poked_by_users[str(poked_by_user.id)]['name']
                poked_by_users[str(poked_by_user.id)] = {
                    'times': times,
                    'name': name
                }
            else:
                # si quien pokea no existe en memoria
                poked_by_users[str(poked_by_user.id)] = {
                    'times': 1,
                    'name': poked_by_user.name
                }
        else:
            #no me están pokeando
            usr = users[str(poked_user.id)]
            if hasattr(usr, 'times_poked'):
                print("times_poked:" +str(usr.times_poked))
                usr.times_poked +=  1
            else:
                setattr(users[str(poked_user.id)], 'times_poked', 1)
    user_data = {
        "id": user.id,
        "name": user.name
    }
    sorted_poked_by_users = dict(sorted(poked_by_users.items(), key=lambda item:item[0], reverse=True))
    return render_template("pokes.html", user=user_data, poked_by_users=sorted_poked_by_users, poked_users=users)


@app.route('/poke_user/<int:poked_user_id>/')
def poke_user(poked_user_id):
    if "user_id" not in session:
        return redirect("/")
    data = {"id": session["user_id"]}
    user = User.get_one(data)
    data = {"poked_by_user_id": session["user_id"],
            "poked_user_id": poked_user_id}
    Poke.poke_user(data)
    return redirect("/pokes")