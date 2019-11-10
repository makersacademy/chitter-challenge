require 'peeps'

describe Peeps do
  describe '.create' do
    it 'creates a new peep' do
      connection = PG.connect(dbname: 'chitter_test')
      peep = Peeps.add(peep: 'My first Peep!')

      expect(peep).to be_a Peeps
      expect(peep.time).to eq peep.time
      expect(peep.peep).to eq "My first Peep!"
    end
  end
end
