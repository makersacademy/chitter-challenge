require 'peeps'

describe Peep do
  describe '.all' do
    it 'returns all peeps in chronological order' do
      peeps = Peep.all

      expect(peeps).to include 'peep 6/1'
      expect(peeps).to include 'peep 5/1'
      expect(peeps).to include 'peep 4/1'
      expect(peeps).to include 'peep 3/1'
      expect(peeps).to include 'peep 2/1'
      expect(peeps).to include 'peep 1/1'
    end
  end
end
