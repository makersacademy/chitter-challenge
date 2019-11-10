require 'peep'

describe Peep do
  describe '.all' do

    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (peep) VALUES ('Test Peep 1');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('Test Peep 2');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('Test Peep 3');")
      
      all_peeps = Peep.all

      expect(all_peeps).to include("Test Peep 1")
      expect(all_peeps).to include("Test Peep 2")
      expect(all_peeps).to include("Test Peep 3")
    end

  end

  describe '.create' do
    it 'creates a peep' do
      Peep.create(peep: "Test peep xyz")

      expect(Peep.all).to include "Test peep xyz"
    end
  end

end
