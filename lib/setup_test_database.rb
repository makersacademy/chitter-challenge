require 'pg'

connection = PG.connect(dbname: 'chitter')

connection.exec('TRUNCATE bookmarks RESTART IDENTITY;')
