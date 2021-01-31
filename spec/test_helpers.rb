require "pg"

def create_peep(message:)
  connection = PG.connect(dbname: "message_manager_test")
  result = connection.exec("INSERT INTO messages (message) VALUES ('#{message}') RETURNING id, message, date_time_stamp;")
  result.first
end