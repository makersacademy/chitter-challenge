require 'pg'

p 'setting up test database...'

connection = PG.connect(dbname: 'chitter_test')

# clear the bookmarks table
connection.exec('TRUNCATE messages RESTART IDENTITY;')
