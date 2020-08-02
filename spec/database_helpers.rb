require 'database_connection'

def persisted_data(id:)
  conn = DatabaseConnection.setup('bookmark_manager_test')
  result = conn.query("SELECT * FROM bookmarks WHERE id = #{id};")
  result.first
end
