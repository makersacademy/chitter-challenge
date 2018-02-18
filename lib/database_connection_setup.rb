require_relative 'database_connection'

DatabaseConnection.setup('chitter_' + ENV['RACK_ENV'])
