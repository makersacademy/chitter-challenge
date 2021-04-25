require './lib/databaseconnection'

ENV['ENVIRONMENT'] == 'test' ? DatabaseConnection.setup('chitter_test') : DatabaseConnection.setup('chitter')