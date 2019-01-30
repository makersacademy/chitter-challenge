require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all
      
      expect(peeps).to include("HELLO")
      expect(peeps).to include("This is my second peep")
    end
  end
end
