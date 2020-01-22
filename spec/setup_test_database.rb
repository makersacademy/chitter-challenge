require 'pg'

p "Setting up test database..."

  def setup_test_database
    connection = PG.connect(dbname: 'chitterbase_test')
    connection.exec("TRUNCATE peeps;")

  end 
