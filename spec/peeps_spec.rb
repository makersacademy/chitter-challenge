require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      peeps = Peep.all
      expect(peeps).to include 'Knock knock'
    end
  end
end
