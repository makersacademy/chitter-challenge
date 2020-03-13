require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      peeps = Peep.all

      expect(peeps).to include("First Peep")
      expect(peeps).to include("Second Peep")
      expect(peeps).to include("Third Peep")
    end
  end
end
