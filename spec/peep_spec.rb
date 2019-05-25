require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('hello');")
      connection.exec("INSERT INTO peeps (message) VALUES('world');")

      peeps = Peep.all
      expect(peeps).to include('hello')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'My first peep')
      expect(Peep.all).to include 'My first peep'
    end
  end

end
