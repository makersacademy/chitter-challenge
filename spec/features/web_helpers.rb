require "spec_helper.rb"
require "pg"

def clear_messages_table(database = "chitter_test")
  connection = PG.connect(dbname: database)
  connection.exec("TRUNCATE TABLE messages")
end

def clear_users_table(database = "chitter_test")
  connection = PG.connect(dbname: database)
  connection.exec("TRUNCATE TABLE users")
end
