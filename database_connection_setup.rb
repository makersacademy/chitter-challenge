require_relative 'lib/database_connection'

ENV['RACK_ENV'] ||= 'development'

DatabaseConnection.setup
