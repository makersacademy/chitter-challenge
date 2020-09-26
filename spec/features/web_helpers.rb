require "spec_helper.rb"

def clear_table(database = "chitter_test")
  connection = PG.connect(dbname: database)
  connection.exec("TRUNCATE TABLE bookmarks")
end
