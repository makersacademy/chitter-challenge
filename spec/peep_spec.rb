require 'peep'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_data_test')
      Peep.add("RyanGrimes", "Test peep")

      peep = Peep.all
      expect(peep.length).to eq 1
      expect(peep.first.message).to eq "Test peep"
    end
  end

  describe '#add' do
    it 'adds a new peep' do
      connection = PG.connect(dbname: 'chitter_data_test')
      Peep.add("RyanGrimes", "Test peep")
      Peep.add("GrimesRyan", "Pest teep")
      peep = Peep.all
      expect(peep.length).to eq 2
    end
  end
end
