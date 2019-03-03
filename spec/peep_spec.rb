require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns the list of peeps' do
      peeps = Peeps.all
      expect(peeps).to include("Hello!")
      expect(peeps).to include("Second peep")
    end
  end


end
