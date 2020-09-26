require 'pg'

def add_peeps_db
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("INSERT INTO peeps (peep) VALUES ('first peep');")
  connection.exec("INSERT INTO peeps (peep) VALUES ('second peep');")
end 