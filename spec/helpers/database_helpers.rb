require 'pg'

def truncate_test_tables
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE TABLE peeps, users;')
end

def persisted_data(id:)
  PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{id};")
end