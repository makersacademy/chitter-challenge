require 'pg'

connection = PG.connect dbname: 'chitter'
connection.exec("DELETE FROM peeps;")
