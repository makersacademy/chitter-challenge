require 'pg'

def setup_test_db
  p "Setting up test database..."

    if ENV['ENVIRONMENT'] == 'test'
      connection = DbConnection.setup('chitter_test')
      connection.exec("TRUNCATE peeps;")
    else
      connection = DbConnection.setup('chitter')
    end
end
