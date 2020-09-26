require "spec_helper.rb"

def clear_table(database = "shore_test")
  DatabaseConnection.setup(database)
  DatabaseConnection.query("TRUNCATE TABLE bottles")
end