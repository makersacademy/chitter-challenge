require 'peep'

describe Peep do 
  describe '.all' do 
    it 'returns all the peeps' do
       connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (message_body) VALUES ('Example peep posted at 3pm');")
      connection.exec("INSERT INTO peeps (message_body) VALUES ('Example peep posted at 2pm');")
      connection.exec("INSERT INTO peeps (message_body) VALUES ('Example peep posted at 1pm');")

      peeps = Peep.all

       expect(peeps).to include("Example peep posted at 3pm")
       expect(peeps).to include("Example peep posted at 2pm")
       expect(peeps).to include("Example peep posted at 1pm")
    end 
  
  
  end 

end 