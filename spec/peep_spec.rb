require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("This is the first peep")
      expect(peeps).to include("This is the second peep")
      expect(peeps).to include("This is the third peep")
    end
  end
end
