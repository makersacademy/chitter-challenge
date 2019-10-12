require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("first peep")
      expect(peeps).to include("second peep")
      expect(peeps).to include("third peep")
    end
  end
end
