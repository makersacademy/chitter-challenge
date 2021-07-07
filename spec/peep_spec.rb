require './lib/peep.rb'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES('Good morning');")
      connection.exec("INSERT INTO peeps (message) VALUES('Good afternoon');")
      connection.exec("INSERT INTO peeps (message) VALUES('Good night');")

      peeps = Peep.all

      expect(peeps).to include("Good morning")
      expect(peeps).to include("Good afternoon")
      expect(peeps).to include("Good night")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'hello world')

      expect(Peep.all).to include 'hello world'
    end
  end
end
