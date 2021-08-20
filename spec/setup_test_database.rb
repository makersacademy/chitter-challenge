require 'PG'

def setup_test_database
  p "Refreshing test database..."

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps;")
end
