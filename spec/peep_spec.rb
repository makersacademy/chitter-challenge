require 'peep'

describe Peep do
  describe '.all' do
    it 'returns the list of peeps' do
      peeps = Peeps.all?
      expect(peeps).to include("Hey, it's the weekend! ")
      expect(peeps).to include("Hey, we're students at Makers! ")
    end
  end


end
