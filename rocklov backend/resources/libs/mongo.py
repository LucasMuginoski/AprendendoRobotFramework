import pymongo
import bson
from pymongo import MongoClient

client = MongoClient('mongodb+srv://mongouser:sdf56JKL!@cluster0.65iea.mongodb.net/Rocklov?retryWrites=true&w=majority')
db = client['rocklov']

def get_mongo_id():
    return bson.objectid.ObjectId()

def remove_user_by_email(user_email):
    users = db['users']
    users.delete_many({'email': user_email})    

def remove_equipo(equipo_name):
    equipos=db['equipos']
    equipos.delete_many({'name':equipo_name})
