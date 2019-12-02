require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter')

      # Add the test data
      connection.exec("INSERT INTO peeplist (name, username, peep, created_on, last_login) VALUES ('Gabby', 'gsang', 'hello all', current_timestamp, CURRENT_DATE );")
      connection.exec("INSERT INTO peeplist (name, username, peep, created_on, last_login) VALUES ('Sonny', 'sonny1', 'hi there', current_timestamp, CURRENT_DATE );")
      connection.exec("INSERT INTO peeplist (name, username, peep, created_on, last_login) VALUES('Snake', 'hiss1', 'hi there', current_timestamp, CURRENT_DATE);")

      # peeps = Peeps.all
    end
  end
end
