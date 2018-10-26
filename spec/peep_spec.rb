require 'peep'

describe Peep do
  describe '#all' do
    it 'returns a list of all peeps' do
      peeps = Peep.all
      expect(peeps).to include 'This is a test peep!'
    end
  end
end
