require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all Peeps' do
      peeps = Peep.all

      expect(peeps).to include("Dear diary")
      expect(peeps).to include("Feeling blue")
      expect(peeps).to include("Happy thoughts")
    end
  end
end
