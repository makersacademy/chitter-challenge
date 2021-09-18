require_relative 'postgres_db.rb'

if ENV['ENVIRONMENT'] == 'test'
  PGDatabase.connect('chitter_test')
else
  PGDatabase.connect('chitter')
end