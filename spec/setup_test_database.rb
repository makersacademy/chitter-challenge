require 'pg'

connection = PG.connect(dbname: 'chitter')

connection.exec('TRUNCATE peeps RESTART IDENTITY;')
connection.exec('TRUNCATE users RESTART IDENTITY;')
