from flask_login import UserMixin

class UserDB(UserMixin):
    def __init__(self, id, username, password):
        self.id = id
        self.username = username
        self.password = password


    