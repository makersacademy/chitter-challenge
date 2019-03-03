require 'pg'

  def clear_test
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("TRUNCATE peeps RESTART IDENTITY CASCADE;")
    connection.exec("TRUNCATE users RESTART IDENTITY CASCADE;")
 end