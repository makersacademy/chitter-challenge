require 'pg'

def set_up_chitter_messages do
  p 'setting up chitter...'
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE messages;")
end
