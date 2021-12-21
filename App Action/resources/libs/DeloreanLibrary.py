import psycopg2
from logging import info

class DeloreanLibrary():
    # conexão com Banco de Dados da API
    def connect(self):
        return psycopg2.connect(
            host = 'ec2-54-146-82-179.compute-1.amazonaws.com',
            database ='d1boi4ta25b0r1',
            user ='imzrnuqihaxnhc',
            password ='d16d87daef0d5905dd93395545a0f56b4a269cc76c89491a9fb059504b9818b8'
        )
    
    # Remover aluno pela api
    # No Robot vira uma KW automaticamente => Remove Student    emaildesejado
    def remove_student(self, email):
        
        querry = "delete from students where email = '{}' ".format(email)
        info(querry)
        
        conn = self.connect()
        cur = conn.cursor()
        cur.execute(querry)
        conn.commit()
        conn.close()
        
    def remove_student_by_name(self, name):
        
        querry = "delete from students where name LIKE '%{}%' ".format(name)
        info(querry)
        
        conn = self.connect()
        cur = conn.cursor()
        cur.execute(querry)
        conn.commit()
        conn.close()
        
    # Inserir aluno pela api
    # KW => Insert Student
    def insert_student(self, student):
        
        self.remove_student(student['email'])
        query = ("insert into students (name, email, age, weight, feet_tall, created_at, updated_at)"
                "values('{}', '{}', {}, {}, {}, now(), now());"
                .format(student['name'],student['email'],student['age'],student['weight'],student['feet_tall'])
        )
        info(query)
        
        conn = self.connect()
        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()    
        