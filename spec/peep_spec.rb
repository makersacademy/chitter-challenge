require 'peep'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include 'What a beautil day!'
      expect(peeps).to include 'Going for a run now'
    end
  end
end