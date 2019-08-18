require 'pg'
require 'database_connection'

def persisted_data(id:)
  connection = DatabaseConnection.query("SELECT * FROM posts WHERE id = '#{id}';")
end


def persisted_data_user(id:)
  connection = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
end
