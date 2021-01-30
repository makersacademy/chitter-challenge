require 'pg'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("Select * from #{table} where id = #{id}")
end

def truncate_table(table:)
  # connection = PG.connect(dbname: 'chitter_test')
  # connection.query("delete from #{table}")
end
