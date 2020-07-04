require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("Hello this is a peep")
      expect(peeps).to include("also a peep")
      expect(peeps).to include("another peep")
    end
  end
end
