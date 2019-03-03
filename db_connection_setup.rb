<<<<<<< HEAD
require './lib/db_connection'
=======
require './lib/db_connection.rb'
>>>>>>> 5412637bd88b0fe441dc3502b5a21226b6cf04ae

if ENV['ENVIRONMENT'] == 'test'
  connection = DbConnection.setup('chitter_test')
else
  connection = DbConnection.setup('chitter')
end
