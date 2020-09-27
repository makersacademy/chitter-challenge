require "spec_helper.rb"
require "pg"

def clear_messages_table(database = "chitter_test")
  connection = PG.connect(dbname: database)
  connection.exec("TRUNCATE TABLE messages CASCADE")
end

def clear_users_table(database = "chitter_test")
  connection = PG.connect(dbname: database)
  connection.exec("TRUNCATE TABLE users CASCADE")
end

def add_test_user(database = "chitter_test")
  connection = PG.connect(dbname: database)
  result = connection.exec("INSERT INTO users (username, email, name, password, logged_in) VALUES ('Rara', 'rara@rara.ra', 'Rara Warrior-Princess', crypt('raraisawesome', gen_salt('bf') ), true) RETURNING username;")
  return result.values[0][0]
end
