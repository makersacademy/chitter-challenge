require 'pg'

def reset_test_database
  connection = PG.connect dbname: 'chitter_test'

  connection.exec("TRUNCATE peeps;")

  connection.exec "INSERT INTO users(name, username)
                   VALUES ('Matt Hulbert', 'hulbgoblin');"

  connection.exec "INSERT INTO users(name, username)
                   VALUES ('Paul Fazackerley', 'alittlecross');"

  connection.exec "INSERT INTO users(name, username)
                   VALUES ('Dana Gajewska', 'danusia.x');"

  connection.exec "INSERT INTO peeps(user_id, content, timestamp)
                   VALUES (1, 'May Day is approaching', '2018-11-23 10:27:28');"

  connection.exec "INSERT INTO peeps(user_id, content, timestamp)
                   VALUES (2,'What?!', '2018-11-23 10:20:28');"

  connection.exec "INSERT INTO peeps(user_id, content, timestamp)
                   VALUES(3, 'Hello Chitter!', '2018-11-23 10:30:28');"

end

def persisted_data(id:)
  connection = PG.connect dbname: 'chitter_test'
  result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
  result.first
end
