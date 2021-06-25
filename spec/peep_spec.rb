require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("This is a peep")
      expect(peeps).to include("Peep peep!")
      expect(peeps).to include("peeping away 🐥")
    end
  end
end
