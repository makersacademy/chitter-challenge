require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("The night I lost CTRL")
      expect(peeps).to include("More code, more cache")
      expect(peeps).to include("Everyday, tryna get beta")
    end
  end
end
