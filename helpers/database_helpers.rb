require 'pg'
require './lib/database_connection'

def persisted_data(id_value:, id_type:, table:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE #{id_value} = #{id_value};")
end