require 'chitter'
require 'peep'
require 'database_connection'

  
describe Chitter do
  describe '.create' do
    it 'creates a new peep' do
      peep = Chitter.create(message: "Yo, Tom from MySpace here")
      expect(peep.message).to eq "Yo, Tom from MySpace here" 
    end
  end

    describe '.all' do
      it 'returns a list of peeps' do
        #connects to DB
        connection = PG.connect(dbname: 'bookmark_manager_test')
        # Add the test data
        peep = Chitter.create(message: "Yo, Tom from MySpace here")
        Chitter.create(message: "fakenews")
        Chitter.create(message: "doge to the moon")
        #calls All to return all tests
        peeps = Chitter.all
        #expected outcomes
        expect(peeps.length).to eq 3
        expect(peeps.first).to be_a Peep
        expect(peeps.first.id).to eq peep.id
        expect(peeps.first.message).to eq 'Yo, Tom from MySpace here'
       end
     end
end