require 'pg'

def setup_test_database
  p "\nSetting up test database"

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE post;")

end
