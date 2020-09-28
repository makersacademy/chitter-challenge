require "spec_helper.rb"

<<<<<<< HEAD
def clear_table(database = "shore_test")
  DatabaseConnection.setup(database)
  DatabaseConnection.query("TRUNCATE TABLE bottles")
end
=======
def clear_table(table, database = "shore_test")
  DatabaseConnection.setup(database)
  DatabaseConnection.query("TRUNCATE TABLE #{table}")
end
>>>>>>> assets
