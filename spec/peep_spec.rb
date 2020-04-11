require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      
      expect(peeps).to include("900 People die from Coronavirus")
      expect(peeps).to include("Lockdown is lifted")
      expect(peeps).to include("Coronavirus is over!")
    end
  end
end