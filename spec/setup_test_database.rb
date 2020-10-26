require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_members_test')

connection.exec("TRUNCATE chitter_members_data;")
