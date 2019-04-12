require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps VALUES(1, 'First peep!');")
      connection.exec("INSERT INTO peeps VALUES(2, 'Second peep!');")

      peeps = Peep.all

      expect(peeps).to include('First peep!')
      expect(peeps).to include('Second peep!')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(content: 'Test Peep')
      expect(Peep.all).to include 'Test Peep'
    end
  end
end
