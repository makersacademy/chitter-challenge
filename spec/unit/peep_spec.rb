require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all the peeps' do
      peeps = Peep.all
      expect(peeps).to include("Hello!")
      expect(peeps).to include("Hello again!")      
    end
  end
end
