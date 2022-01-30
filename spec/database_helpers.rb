# require './lib/database_connection'

# def persisted_data(table:, id:)
#   DatabaseConnection.query(
#     "SELECT * FROM $1 WHERE id = $2;",
#     [table, id]
#   )
# end

require 'pg'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end

# def persisted_data(id:)
#   connection = PG.connect(dbname: 'chitter_test')
#   result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
#   result.first
# end