from flask_app import app as aplication

from flask_app.controllers import users, pokes


if __name__ == "__main__":
    aplication.run()