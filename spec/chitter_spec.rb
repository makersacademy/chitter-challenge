require 'chits'
describe Chits do
    describe '.all' do
      it 'returns all chitters' do
       
        connection = PG.connect(dbname: 'Chitter_test')

    # Add the test data
        connection.exec("INSERT INTO messages (message) VALUES('Hey you! this is Chitter');")
        connection.exec("INSERT INTO messages (message) VALUES('Have something to Chit?');")
        connection.exec("INSERT INTO messages (message) VALUES('Chit it now!');")
          
       
        chitter = Chits.all
  
        expect(chitter).to include("Hey you! this is Chitter")
        expect(chitter).to include("Have something to Chit?")
        expect(chitter).to include("Chit it now!")
      end
    end
  end
  