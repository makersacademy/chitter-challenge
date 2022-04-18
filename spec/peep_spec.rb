require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("peep 1")
      expect(peeps).to include("peep 2")
      expect(peeps).to include("peep 3")
    end
  end
end