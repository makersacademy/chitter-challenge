require './lib/database_connection'

PG.connect(dbname: 'chitter_test') if ENV['RACK_ENV'] == 'test'
PG.connect(dbname: 'chitter') if ENV['RACK_ENV'] != 'test'