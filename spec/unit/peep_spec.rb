require 'model/peep.rb'
require 'pg'
describe Peep do
  describe '.all' do
    it 'returns all my peeps in chronological order' do
      connection = PG.connect(dbname: 'my_peeps_test')
      connection.exec("INSERT INTO peeps (peep) VALUES ('My first peep');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('My second peep');")

      peeps = Peep.all
      expect(peeps).to include "My first peep"
      expect(peeps).to include "My second peep"
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(peep: 'test peep')

      expect(Peep.all).to include 'test peep'
    end
  end
end
