require 'pg'


puts 'Setting up databases...'
conn = PG.connect(dbname: 'postgres')

conn.exec('CREATE database chitter_development')
puts 'Development database setup'

conn.exec('CREATE database chitter_test')
puts 'Test database setup'
