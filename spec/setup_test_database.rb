require 'pg'

p 'Setting up test database...'

def setup_test_database
  # connection = PG.connect(dbname: 'chitter')

  # connection.exec('TRUNCATE chat;')

  con = PG.connect(dbname: 'chitter_test')
  con.exec("DROP TABLE IF EXISTS chat;")
  con.exec("CREATE TABLE chat (id SERIAL PRIMARY KEY, time TIMESTAMP, nickname VARCHAR(60), msg VARCHAR(60));")
  con.exec("INSERT INTO chat (nickname, msg) VALUES ('Esmeralda', 'Envio un mensaje')")
  con.exec("INSERT INTO chat (nickname, msg) VALUES ('Carlitos', 'No se que escribir')")
  con.exec("INSERT INTO chat (nickname, msg) VALUES ('Esmeralda', 'Envio mi segundo mensaje');")
end
