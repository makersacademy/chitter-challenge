require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # add test data
      connection.exec("INSERT INTO peeps (text) VALUES('Hello I am a peep!');")
      connection.exec("INSERT INTO peeps (text) VALUES('I too am a peep!');")
      
      peeps = Peep.all
    
      expect(peeps).to include('Hello I am a peep!')
      expect(peeps).to include('I too am a peep!')
    end
  end

  describe '.create' do
    it 'creates a peep' do
      Peep.create(text: 'My first peep!')
      expect(Peep.all).to include 'My first peep!'
    end
  end

end
