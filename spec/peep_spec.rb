require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a new peep!');")
      peeps = Peep.all
      expect(peeps).to include('This is a new peep!')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'This is a new peep!')
      expect(Peep.all).to include 'This is a new peep!'
    end
  end
end

