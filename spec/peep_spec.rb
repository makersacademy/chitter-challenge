require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep) VALUES('This is my first Peep');")
      connection.exec("INSERT INTO peeps (peep) VALUES('And this is my second');")

      peeps = Peep.all

      expect(peeps).to include "This is my first Peep"
      expect(peeps).to include "And this is my second"
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create([peep: "Testing a Peep"])

      expect(Peep.all).to include "Testing a Peep"
    end
  end
end
