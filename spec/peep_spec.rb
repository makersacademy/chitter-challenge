require 'peep'

describe Peep do
  describe '.all' do
    it 'lists all peeps' do
      peeps = Peep.all
      expect(peeps).to include 'Good morning all!'
      expect(peeps).to include 'Summer is here yay'
    end
  end
end
