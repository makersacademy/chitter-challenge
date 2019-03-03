require 'pg'

def setup_test_db
  p "Setting up test database..."
<<<<<<< HEAD
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
=======

    if ENV['ENVIRONMENT'] == 'test'
      connection = DbConnection.setup('chitter_test')
      connection.exec("TRUNCATE peeps;")
    else
      connection = DbConnection.setup('chitter')
    end
>>>>>>> 5412637bd88b0fe441dc3502b5a21226b6cf04ae
end
