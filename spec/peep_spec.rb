require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (content) VALUES('This is my first chitter!');")
      connection.exec("INSERT INTO peeps (content) VALUES('Hey there! This is a peep!');")
      connection.exec("INSERT INTO peeps (content) VALUES('Urgh! The weather today is horrible.');")
      connection.exec("INSERT INTO peeps (content) VALUES('Coronavirus is really killing the mood here');")

      peeps = Peep.all
      expect(peeps).to include('This is my first chitter!')
      expect(peeps).to include('Hey there! This is a peep!')
      expect(peeps).to include('Urgh! The weather today is horrible.')
      expect(peeps).to include('Coronavirus is really killing the mood here')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(peep: 'Testing a peep!')

      expect(Peep.all).to include 'Testing a peep!'
    end
  end
end