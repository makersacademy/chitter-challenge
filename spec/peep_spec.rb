require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')
  
      connection.exec("INSERT INTO peeps (text) VALUES ('Its my first peep!');")
      connection.exec("INSERT INTO peeps (text) VALUES('Peep, peep, peep!');")
      
  
      peeps = Peep.all
  
      expect(peeps).to include('Its my first peep!')
      expect(peeps).to include('Peep, peep, peep!')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(text: 'Im a new peep!')
      expect(Peep.all).to include 'Im a new peep!'
    end
  end
end
