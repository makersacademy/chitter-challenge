require 'pg'

connection = PG.connect :dbname => 'chitter_test'
connection.exec 'SET client_min_messages TO WARNING;'
connection.exec 'TRUNCATE TABLE peeps'
connection.exec 'TRUNCATE TABLE users CASCADE'
