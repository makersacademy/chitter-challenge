require 'pg'

def setup_test_database
  p "setting up test data base......"
  tables = ["users", "peeps"]
  connection = PG.connect(dbname: 'chitter_test')

  tables.each do |table|
    connection.exec("TRUNCATE #{table};")
  end
end
