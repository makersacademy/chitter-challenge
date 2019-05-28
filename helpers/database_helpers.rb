require './lib/database_connection'

def persisted_data(id_type:, id_value:, table:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE #{id_type} = '#{id_value}'").first
end
