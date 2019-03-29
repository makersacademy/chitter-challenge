require 'pg'

connection = PG.connect(dbname: 'chitter_app_test')

connection.exec('TRUNCATE chitter;')
