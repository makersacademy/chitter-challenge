require 'peep'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      peep = Peep.all

      expect(peep).to include("my first peep")
      expect(peep).to include("my second peep")
      expect(peep).to include("my third peep")
    end
  end
end
