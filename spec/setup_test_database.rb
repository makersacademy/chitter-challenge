require 'pg'

connection = PG.connect :dbname => 'chitter_test'
connection.exec 'TRUNCATE TABLE peeps'
connection.exec 'TRUNCATE TABLE users'
