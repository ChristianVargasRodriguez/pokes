from flask import flash, request
from flask_app.config.mysqlconnection import connectToMySQL

import datetime

import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$') 

class User:
    db_name = 'poke'
    def __init__(self,db_data):
        self.id = db_data['id']
        self.name = db_data['name']
        self.alias = db_data['alias']
        self.email = db_data['email']
        self.password = db_data['password']
        self.date_birth = db_data['date_birth']
        self.created_at = db_data['created_at']
        self.updated_at = db_data['updated_at']
    
    def __str__(self) -> str:
        result = "Dump de usuario"
        user_attrs = [a for a in dir(self) if not a.startswith('__') and not callable(getattr(self, a))]
        for attr in user_attrs:
            result += attr + ": " + getattr(self, attr) + "\n"
        return result

    # 1) READ OPERATIONS
    # 1.1) Get All Users
    @classmethod
    def get_all(cls):
        query = "SELECT * FROM user;"
        results = connectToMySQL(cls.db_name).query_db(query)
        users = {}
        for result in results:
            user=cls(result)
            users[str(user.id)] = user
        return users

    # 1.2) Get One User By Id
    @classmethod
    def get_one(cls,data):
        query = "SELECT * FROM user WHERE id = %(id)s;"
        results = connectToMySQL(cls.db_name).query_db(query,data)
        if len(results) < 1:
            return False
        return cls(results[0])

    # 1.3) Get One User By Email
    @classmethod
    def get_by_email(cls,data):
        query = "SELECT * FROM user WHERE email = %(email)s;"
        results = connectToMySQL(cls.db_name).query_db(query,data)
        if len(results) < 1:
            return False
        return User(results[0])
    
    # 2) CREATE OPERATIONS
    # 2.1) Create User
    @classmethod
    def save(cls,data):
        query = "INSERT INTO user (name, alias, email, password, date_birth, created_at, updated_at) VALUES(%(name)s, %(alias)s, %(email)s, %(password)s, %(date_birth)s, NOW(), NOW())"
        results = connectToMySQL(cls.db_name).query_db(query,data) 
        return results

    # 3) UPDATE OPERATIONS
    # -----

    # 4) DELETE OPERATIONS
    # -----

    # 5) VALIDATIOS
    # 5.1) Validate User
    @staticmethod
    def validate_user(user):
        is_valid = True
        if len(user['name']) < 2:
            is_valid = False
            flash("Name must be at least 2 characters.","register")
        if len(user['alias']) < 2:
            is_valid = False
            flash("Alias must be at least 2 characters.","register")
        if not EMAIL_REGEX.match(user['email']):
            is_valid = False
            flash("Invalid Email Address.","register")
        if len(user['password']) < 8:
            is_valid = False
            flash("Password must be at least 8 characters.","register")
        if user['password'] != user['confirm']:
            is_valid = False
            flash("Passwords do not match!","register")
        
        # obtener la fecha de nacimiento ingresada por el usuario
        date_birth = request.form['date_birth']
        today = datetime.date.today()
        if date_birth == "":
            date_birth = str(today)
        date_birth = datetime.datetime.strptime(date_birth, '%Y-%m-%d').date()
        # calcular la edad en años
        age = today.year - date_birth.year - ((today.month, today.day) < (date_birth.month, date_birth.day))
        if age < 16:
            is_valid = False
            flash("Debe ser mayor de 16 años para registrarse.","register")

        return is_valid
