require './lib/peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("My first peep")
      expect(peeps).to include("Another peep...")
      expect(peeps).to include("Hello")
    end
  end
end
