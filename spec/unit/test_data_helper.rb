require "db_connection"

def connect_delete_and_create_data
  DbConnection.query('TRUNCATE peeps, users RESTART IDENTITY CASCADE;')
  Peep.create("My first peep")
  Peep.create("I have just added this")
end