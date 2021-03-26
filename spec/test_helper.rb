require './lib/db_connection'

def setup_users_table
  DbConnection.check_env

  DbConnection.query("INSERT INTO users(username, password, email)
                      VALUES ('captainfrog', 'password1', 'captainfrog@gmail.com');")
  DbConnection.query("INSERT INTO users(username, password, email)
                      VALUES ('littlebird', 'password1', 'littlebird@gmail.com');")
  DbConnection.query("INSERT INTO users(username, password, email)
                      VALUES ('bigsquirrel', 'password1', 'bigsquirrel@gmail.com');")
end

def setup_peeps_table
  DbConnection.check_env

  DbConnection.query("INSERT INTO peeps(message, user_id)
                      VALUES ('Hey this is fun right?', '1');")
  DbConnection.query("INSERT INTO peeps(message, user_id)
                      VALUES ('First peep!', '2');")
  DbConnection.query("INSERT INTO peeps(message, user_id)
                      VALUES ('How do you do this?', '3');")
end

def setup_tags_table
  DbConnection.check_env

  DbConnection.query("INSERT INTO tags(tag) VALUES ('#cats');")
  DbConnection.query("INSERT INTO tags(tag) VALUES ('#frogs');")
  DbConnection.query("INSERT INTO tags(tag) VALUES ('#hello');")
  DbConnection.query("INSERT INTO tags(tag) VALUES ('#whodis');")
  DbConnection.query("INSERT INTO tags(tag) VALUES ('#bears');")
  DbConnection.query("INSERT INTO tags(tag) VALUES ('#hashwhats');")
  DbConnection.query("INSERT INTO tags(tag) VALUES ('#first');")
  DbConnection.query("INSERT INTO tags(tag) VALUES ('#nuts');")
end

def setup_peep_tag_relation_table
  DbConnection.check_env

  DbConnection.query("INSERT INTO peep_tag_relation(peep_id, tag_id) VALUES ('1', '2');")
  DbConnection.query("INSERT INTO peep_tag_relation(peep_id, tag_id) VALUES ('1', '3');")
  DbConnection.query("INSERT INTO peep_tag_relation(peep_id, tag_id) VALUES ('1', '4');")
  DbConnection.query("INSERT INTO peep_tag_relation(peep_id, tag_id) VALUES ('2', '2');")
  DbConnection.query("INSERT INTO peep_tag_relation(peep_id, tag_id) VALUES ('2', '4');")
  DbConnection.query("INSERT INTO peep_tag_relation(peep_id, tag_id) VALUES ('2', '6');")
  DbConnection.query("INSERT INTO peep_tag_relation(peep_id, tag_id) VALUES ('3', '5');")
  DbConnection.query("INSERT INTO peep_tag_relation(peep_id, tag_id) VALUES ('3', '7');")
  DbConnection.query("INSERT INTO peep_tag_relation(peep_id, tag_id) VALUES ('3', '8');")
end
