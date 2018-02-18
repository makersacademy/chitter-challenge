require 'database_connection'

DatabaseConnection.setup('chitter_' + ENV['RACK_ENV'])
