require 'pg'

def refresh_db
  connection = PG.connect dbname: "chitter_test", user: ENV["USER"]
  connection.exec("truncate chitter")
  connection.close
end
