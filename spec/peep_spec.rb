require 'peep'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include("My 1st peep")
      expect(peeps).to include("My 2nd peep")
      expect(peeps).to include("My 3rd peep")
    end
  end
end
