require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps).to include("Good morning!")
      expect(peeps).to include("Good evening!")
    end
  end
end 
