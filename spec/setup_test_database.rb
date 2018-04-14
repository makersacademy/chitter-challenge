require 'pg'

def clearout
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps")
end
