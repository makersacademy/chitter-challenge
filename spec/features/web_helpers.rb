require "spec_helper.rb"
require "pg"

def clear_database_table(database = "chitter_test")
  connection = PG.connect(dbname: database)
  connection.exec("TRUNCATE TABLE messages")
end
