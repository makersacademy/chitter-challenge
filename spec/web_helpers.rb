def truncate_and_load_beets
  connection = PG::Connection.open(:dbname => 'bitter_test')
  result  = connection.exec(
    "TRUNCATE beets;
    INSERT INTO beets (beet_text) VALUES ('No Brexit!');
    INSERT INTO beets (beet_text) VALUES ('SJWs make me sick!');
    INSERT INTO beets (beet_text) VALUES ('I love Coding!');
    ")
end