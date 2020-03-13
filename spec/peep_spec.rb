require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peeps) VALUES ('First Peep');")
      connection.exec("INSERT INTO peeps (peeps) VALUES ('Second Peep');")
      connection.exec("INSERT INTO peeps (peeps) VALUES ('Third Peep');")

      peeps = Peep.all

      expect(peeps).to include("First Peep")
      expect(peeps).to include("Second Peep")
      expect(peeps).to include("Third Peep")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(peeps: 'Hello there')

      expect(Peep.all).to include 'Hello there'
    end
  end
end
