require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep) VALUES('Peep 1!');")
      connection.exec("INSERT INTO peeps (peep) VALUES('Peep 2!');")

      peeps = Peep.all

      expect(peeps).to include 'Peep 1!'
      expect(peeps).to include 'Peep 2!'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(peep: "New peep")

      expect(Peep.all).to include "New peep"
    end
  end

end
