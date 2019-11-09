def truncate_and_load_beets
  connection = PG::Connection.open(:dbname => 'bitter_test')
  result  = connection.exec(
    "TRUNCATE beets;
    INSERT INTO beets (beet_text, timestamp) VALUES ('No Brexit!', '#{Time.now}');
    INSERT INTO beets (beet_text, timestamp) VALUES ('SJWs make me sick!', '#{Time.now}');
    INSERT INTO beets (beet_text, timestamp) VALUES ('I love Coding!', '#{Time.now}');
    ")
end