require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("This is a peep")
      expect(peeps).to include("This is another peep")
      expect(peeps).to include("This is the lucky third peep")
    end
  end
end