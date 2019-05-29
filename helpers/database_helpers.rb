require 'pg'
require './lib/database_connection'

def persisted_data(id:, id_value:, table:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE #{id_value} = #{id};")
end