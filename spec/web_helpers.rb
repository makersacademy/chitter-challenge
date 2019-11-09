def truncate_dbs
  connection = PG::Connection.open(:dbname => 'bitter_test')
  connection.exec("TRUNCATE beets, users;")
end

def load_beets
  connection = PG::Connection.open(:dbname => 'bitter_test')
  connection.exec("
    INSERT INTO beets (beet_text, timestamp) VALUES ('No Brexit!', '#{Time.now}');
    INSERT INTO beets (beet_text, timestamp) VALUES ('SJWs make me sick!', '#{Time.now}');
    INSERT INTO beets (beet_text, timestamp) VALUES ('I love Coding!', '#{Time.now}');
    ")
end