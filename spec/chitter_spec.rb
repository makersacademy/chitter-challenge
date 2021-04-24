require 'chitter'

describe Chitter do

  describe '#.all method' do
    it 'can retrun all peeps' do
      peeps = Chitter.all
      expect(peeps).to include("Test Peep")
      expect(peeps).to include("Peep Testing!")
    end
  end

end