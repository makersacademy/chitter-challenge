require './lib/peep.rb'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("Good morning")
      expect(peeps).to include("Good afternoon")
      expect(peeps).to include("Good night")
    end
  end
end
