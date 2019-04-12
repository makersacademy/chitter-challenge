require 'pg'
require_relative '../lib/database_connection'

def persisted_data(id:)
  DatabaseConnection.setup(dbname: 'chitter_test')
  reuslt = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id};")
  result.first
end
