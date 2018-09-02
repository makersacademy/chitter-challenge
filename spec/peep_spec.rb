require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("the sky is blue")
      expect(peeps).to include("the sea is green")
      expect(peeps).to include("fire is red")
    end
  end
end
