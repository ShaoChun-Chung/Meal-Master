import mysql.connector
CITY2ID = {'Milan': 348156, 'Rome': 461789, 'Paris': 415144}
HOST = "localhost"
USER = "root"
PASSWORD = "820510"

# https://rapidapi.com/apidojo/api/the-fork-the-spoon

class myDB:
    def __init__(self, conn) -> None:
        self.conn = conn
        self.mycursor = self.conn.cursor()
    
    def get_cursor(self):
        return self.mycursor
    
    def dump(self):
        output = self.conn.RunCommand(f"mysqldump -u {USER} -p{PASSWORD} --all-databases > database.sql")
    
    def create_tables(self):
        self.mycursor.execute("USE NYU_Bigdata_Final")

        # create table "restaurants"
        query_for_create_Restaurant_Table = 'CREATE TABLE restaurants ( \
        r_id INT NOT NULL AUTO_INCREMENT, \
        c_id INT, \
        r_name VARCHAR(100) NOT NULL, \
        r_type VARCHAR(100), \
        r_price INT, \
        r_address VARCHAR(100), \
        PRIMARY KEY (r_id), \
        FOREIGN KEY (c_id) REFERENCES city(c_id), \
        CONSTRAINT r_name_unique UNIQUE (r_name))'
        self.mycursor.execute(query_for_create_Restaurant_Table)

        # create table "users"
        query_for_create_User_Table = 'CREATE TABLE users ( \
        u_id INT NOT NULL AUTO_INCREMENT, \
        u_email VARCHAR(100) NOT NULL, \
        u_password VARCHAR(100) NOT NULL, \
        u_name VARCHAR(100) NOT NULL, \
        u_gender VARCHAR(10) NOT NULL,\
        u_birth DATE NOT NULL, \
        c_id INT NOT NULL, \
        PRIMARY KEY (u_id), \
        FOREIGN KEY (c_id) REFERENCES city(c_id), \
        CONSTRAINT user_unique UNIQUE (u_email))'
        self.mycursor.execute(query_for_create_User_Table)

        # create table "records"
        query_for_create_Record_Table = 'CREATE TABLE records ( \
        u_r_id INT NOT NULL AUTO_INCREMENT, \
        u_id INT NOT NULL, \
        r_id INT NOT NULL, \
        rating INT NOT NULL, \
        PRIMARY KEY (u_r_id), \
        FOREIGN KEY (u_id) REFERENCES users(u_id), \
        FOREIGN KEY (r_id) REFERENCES restaurants(r_id))'
        self.mycursor.execute(query_for_create_Record_Table)
        
    def update_restaurant(rest_id):
        return



    class ResTB:
        def __init__(self) -> None:
            pass

        def connect():
            return
        
        def get_rests_by_city(city_name):
            rests = []
            return rests
        

    class UserTB:
        def __init__(self) -> None:
            pass

        def connect():
            return
        
        def get_user(user_id):
            return
        
        
    class RecordTB:
        def __init__(self) -> None:
            pass

        def connect():
            return
        
        def get_record_by_user(user_id):
            records = []
            return records