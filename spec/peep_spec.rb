require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("peep1")
      expect(peeps).to include("peep2")
      expect(peeps).to include("peep3")
    end
  end
end
