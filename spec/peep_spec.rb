require './lib/peep'

describe Peep do

  describe '#all' do
    it 'returns a list of all peeps' do
      peeps = Peep.all
      expect(peeps).to include("First Peep")
      expect(peeps).to include("Second Peep")
    end
  end
end
