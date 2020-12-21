require 'pg'

def persisted_data_retrieve(table:, id:)
  connection = PG.connect :dbname => 'chitter_test'
  result = connection.exec("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end

def persisted_data_insert(table:, message:)
  connection = PG.connect :dbname => 'chitter_test'
  result = connection.exec("INSERT INTO #{table} (message) VALUES ('#{message}') RETURNING id, message, date_time_stamp;")
  result.first
end
