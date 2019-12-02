require 'peeps'
require 'pg'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeplist (name, username, peep, created_on) VALUES ('Gabby', 'gsang', 'hello all', current_timestamp);")
      connection.exec("INSERT INTO peeplist (name, username, peep, created_on) VALUES ('Sonny', 'sonny1', 'hi there', current_timestamp);")
      connection.exec("INSERT INTO peeplist (name, username, peep, created_on) VALUES('Snake', 'hiss1', 'heya', current_timestamp);")

# peeps = Peeps.all
#
# expect(peeps).to include ("2" "Gabby" "gsang" "hello all")
      # peeps = Peeps.all
    end
  end
end
