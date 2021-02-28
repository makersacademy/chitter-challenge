require 'peeps'

describe Peeps do

  describe '.all' do
    it 'returns all of the peeps' do
      peeps = Peeps.all

      expect(peeps).to include("here is my new peep!")
      expect(peeps).to include("here is my next peep!")
      
    end
  end
end
