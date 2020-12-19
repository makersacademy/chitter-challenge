require 'pg'

def persisted_data_retrieve(id:)
  connection = PG.connect :dbname => 'chitter_test'
  result = connection.exec("SELECT * FROM peeps WHERE id = #{id};")
  result.first
end

def persisted_data_insert(message:)
  connection = PG.connect :dbname => 'chitter_test'
  result = connection.exec("INSERT INTO peeps (message) VALUES ('#{message}') RETURNING id, message, date_time_stamp;")
  result.first
end
