require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_machine_test', user: 'postgres', password: 'password')
connection.exec("TRUNCATE students;")
#connection.close

p "Am I even getting here????"