from flask import flash, request
from flask_app.config.mysqlconnection import connectToMySQL

import datetime

import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$') 

class Poke:
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


    @classmethod
    def poke_user(cls, data):
        query = "INSERT INTO poke (poked_by_user_id, poked_user_id, created_at, updated_at) VALUES(%(poked_by_user_id)s, %(poked_user_id)s, NOW(), NOW())"
        results = connectToMySQL(cls.db_name).query_db(query,data) 
        return results

    @classmethod
    def get_all(cls):
        query = "SELECT * from poke"
        results = connectToMySQL(cls.db_name).query_db(query)
        return results
