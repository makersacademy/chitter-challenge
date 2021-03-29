require './lib/db_connection'

def truncate 
  DbConnection.check_env
  DbConnection.query("TRUNCATE TABLE users, peeps, tags RESTART IDENTITY CASCADE;")
end

def setup_users_table
  DbConnection.query("INSERT INTO users(username, password, email)
                      VALUES ('captainfrog', 'password1', 'captainfrog@notadomain.com');")
  DbConnection.query("INSERT INTO users(username, password, email)
                      VALUES ('littlebird', 'password1', 'littlebird@notadomain.com');")
  DbConnection.query("INSERT INTO users(username, password, email)
                      VALUES ('bigsquirrel', 'password1', 'bigsquirrel@notadomain.com');")
end

def setup_peeps_table
  DbConnection.query("INSERT INTO peeps(message, user_id)
                      VALUES ('Hey this is fun right?', '1');")
  DbConnection.query("INSERT INTO peeps(message, user_id)
                      VALUES ('First peep!', '2');")
  DbConnection.query("INSERT INTO peeps(message, user_id)
                      VALUES ('How do you do this?', '3');")
end

def setup_tags_table
  DbConnection.query("INSERT INTO tags(user_id, peep_id) VALUES ('2', '1');")
  DbConnection.query("INSERT INTO tags(user_id, peep_id) VALUES ('3', '2');")
  DbConnection.query("INSERT INTO tags(user_id, peep_id) VALUES ('1', '3');")
end
