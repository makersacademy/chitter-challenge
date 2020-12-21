require 'pg'

def persisted_data_retrieve(table:, id:)
  connection = PG.connect :dbname => 'chitter_test'
  result = connection.exec("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end

def persisted_data_insert(table:, message:, user_id:)
  connection = PG.connect :dbname => 'chitter_test'
  result = connection.exec("INSERT INTO #{table} (message, user_id) VALUES ('#{message}', '#{user_id}') RETURNING id, user_id, message, date_time_stamp;")
  result.first
end
