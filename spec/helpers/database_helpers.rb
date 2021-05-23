require 'pg'

def truncate_test_tables
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE TABLE peeps, users;')
end

def persisted_data(table:, id:)
  PG.connect(dbname: 'chitter_test').query("SELECT * FROM #{table} WHERE id = #{id};")
end