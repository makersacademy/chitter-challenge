require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      
      expect(peeps).to include("Loving life #brunch")
    end
  end
end