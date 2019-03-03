require 'pg'

p 'Setting up test database...'

def setup_test_database
  con = PG.connect(dbname: 'chitter_test')
  con.exec("DROP TABLE IF EXISTS chat;")
  con.exec("CREATE TABLE chat (id SERIAL PRIMARY KEY, time TIMESTAMP, nickname VARCHAR(60), msg VARCHAR(60));")
  con.exec("INSERT INTO chat (time, nickname, msg) VALUES ('2019-03-03 12:32:37.015157', 'Esmeralda', 'Envio un mensaje')")
  con.exec("INSERT INTO chat (time, nickname, msg) VALUES ('2019-03-03 13:00:09.30805', 'Carlitos', 'No se que escribir')")
  con.exec("INSERT INTO chat (time, nickname, msg) VALUES ('2019-03-03 13:03:30.782394', 'Esmeralda', 'Envio mi segundo mensaje');")
end
