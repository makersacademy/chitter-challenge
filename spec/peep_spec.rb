require './lib/peep'

describe Peep do

  describe '#all' do
    it 'returns a list of all peeps' do
      peeps = Peep.all
      expect(peeps).to include("Peep 1")
      expect(peeps).to include("Peep 2")
    end
  end
end
