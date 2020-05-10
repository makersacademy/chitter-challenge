require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include("A lovely day")
      expect(peeps).to include("An interesting day")
    end
  end
end
