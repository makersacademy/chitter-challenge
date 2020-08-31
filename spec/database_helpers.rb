require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect :dbname => 'chitter_manager_test'
  connection.exec("TRUNCATE peeps, users;")
end

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_manager_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end
