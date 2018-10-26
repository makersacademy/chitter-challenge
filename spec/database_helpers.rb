require 'pg'
require_relative '../lib/database_connection'

def find_by_id(id:)
  result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
  result.first
end
