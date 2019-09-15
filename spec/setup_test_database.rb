require 'pg'

def truncate_table
  DatabaseConnection.query("TRUNCATE TABLE peeps")
end