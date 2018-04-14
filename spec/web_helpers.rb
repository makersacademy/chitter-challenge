require 'pg'

def fill_data
  connection = PG.connect(dbname: 'chitter_test')

  # Add the test data
  connection.exec("INSERT INTO peep (peep, name, handle) VALUES('what up', 'Zuckerberg' , '@zuckyboi');")
  connection.exec("INSERT INTO peep (peep, name, handle) VALUES('Louis is so awesome', 'Daniel Tooke' , '@t00kie_da_w00kie');")
  connection.exec("INSERT INTO peep (peep, name, handle) VALUES('He LIED! LIED! LIED!', 'Donald J. Trump' , '@realDonaldTrump');")
end
