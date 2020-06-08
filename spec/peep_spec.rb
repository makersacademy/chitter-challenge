require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all users peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (userpeep) VALUES('First Peep!');")

      peeps = Peep.all
      expect(peeps).to include('First Peep!')
    end
  end

  describe '.create' do
    it 'allows user to creates a new peep' do
      Peep.create(peep: 'First Peep!')
      expect(Peep.all).to include 'First Peep!'
    end
  end
end
