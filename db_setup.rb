require './lib/db_connection'

 if ENV['ENVIRONMENT'] == 'test'
   DatabaseConnection.setup('chitter_test')
 else
   DatabaseConnection.setup('chitter')
 end