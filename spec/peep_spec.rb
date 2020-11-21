require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("First test peep")
      expect(peeps).to include("Another test peep")
    end
  end

  describe '.create' do
    it 'posts a new peep' do
      Peep.create(message: 'weekend challenges are so much fun')
      expect(Peep.all).to include 'weekend challenges are so much fun'
    end
  end

end
