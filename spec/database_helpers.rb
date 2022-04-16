require 'pg'
require_relative '../lib/peep'
# require_relative '../lib/database_connection'

def wipe_tables
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps, users;")
end


def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.exec("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end