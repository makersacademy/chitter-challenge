require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("test peep")
      expect(peeps).to include("another test peep")
      expect(peeps).to include("a third test peep")
    end
  end
end
