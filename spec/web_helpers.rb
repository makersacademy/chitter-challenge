def truncate_dbs
  connection = PG::Connection.open(:dbname => 'bitter_test')
  connection.exec("TRUNCATE beets, users;")
end

def load_beets
  connection = PG::Connection.open(:dbname => 'bitter_test')
  connection.exec("
    INSERT INTO beets (beet_text, timestamp, user_handle) VALUES ('No Brexit!', '#{Time.now}', 'mr_jones');
    INSERT INTO beets (beet_text, timestamp, user_handle) VALUES ('SJWs make me sick!', '#{Time.now}', 'madame_buffooir');
    INSERT INTO beets (beet_text, timestamp, user_handle) VALUES ('I love Coding!', '#{Time.now}', 'jesus');
    ")
end

def insert_users
  connection = PG::Connection.open(:dbname => 'bitter_test')
  connection.exec("
    INSERT INTO users (first_name, last_name, email, password)
    VALUES ('Thomas', 'Tester', 'tom@test.com', 'itsasecret');

    INSERT INTO users (first_name, last_name, email, password)
    VALUES ('Robert', 'Lobert', 'robert@test.com', 'shhhh');
    
    INSERT INTO users (first_name, last_name, email, password)
    VALUES ('Valerie', 'Mallorie', 'val@test.com', 'password');
    ")
end