import os
import dotenv
import sqlalchemy as alch

dotenv.load_dotenv()


passw = os.getenv("pass_sql")
dbName= "HP"

#mE CONECTO CON LA BASE DE DATOS

connectionData=f"mysql+pymysql://root:{passw}@localhost/{dbName}"
engine = alch.create_engine(connectionData)
