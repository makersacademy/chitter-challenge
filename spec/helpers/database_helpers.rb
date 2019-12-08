def truncator
  dbname = 'chitter_test'
  con = PG.connect dbname: dbname, user: ENV['USER']
  con.exec "TRUNCATE peeps"
  con.exec 'SELECT * FROM peeps'
ensure
  con.close if con
end

def add_row(message)
  dbname = 'chitter_test'
  con = PG.connect dbname: dbname, user: ENV['USER']
  con.exec "INSERT INTO peeps(message) VALUES('#{message}')"
end
