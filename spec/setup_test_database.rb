# in spec/setup_test_database.rb

require 'pg'

def setup_test_database 
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the bookmarks table
  connection.exec("TRUNCATE peeps;")
end

def persisted_data(id:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  result.first
end