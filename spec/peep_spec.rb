require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("First test peep")
      expect(peeps).to include("Another test peep")
    end
  end
end
