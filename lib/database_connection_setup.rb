require_relative 'database_connection.rb'

ENV['ENVIRONMENT'] == 'test' ? DatabaseConnection.setup('chitter_test') : DatabaseConnection.setup('chitter')
