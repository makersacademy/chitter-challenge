require 'pg'

def setup_test_db
  p "Setting up test database..."

    if ENV['ENVIRONMENT'] == 'test'
      connection = DbConnection.setup('chitter_test')
    else
      connection = DbConnection.setup('chitter')
    end

  connection.exec("TRUNCATE peeps;")

end
