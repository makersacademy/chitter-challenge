require 'peep'

describe 'Peep' do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (text) VALUES ('Peep1');")
      connection.exec("INSERT INTO peeps (text) VALUES ('Peep2');")

      peeps = Peep.all

      expect(peeps).to include("Peep1")
      expect(peeps).to include("Peep2")
    end
  end

  describe '#.create' do
    it 'creates a new peep' do
      Peep.create(newpeep: 'Peep3')
      expect(Peep.all).to include 'Peep3'
    end
  end 
end
