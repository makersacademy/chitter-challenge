require 'pg'

def prime_database

  connection = PG.connect(dbname: 'chitter')

  connection.exec("INSERT INTO peeps (peep_text) VALUES('Holy moly, what is this site meant to be??');")
  connection.exec("INSERT INTO peeps (peep_text) VALUES('Just got out of bed, what year is this?');")
  connection.exec("INSERT INTO peeps (peep_text) VALUES('Has anyone seen my motivation, I seem to have lost it.');")

end
