require_relative 'database_connection'

DatabaseConnection.setup('chitter_test') if ENV['RACK_ENV'] == 'test'
DatabaseConnection.setup('chitter') if ENV['RACK_ENV'] != 'test'