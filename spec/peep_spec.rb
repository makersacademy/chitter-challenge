require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include("My 0th test peep")
      expect(peeps).to include("Another test peep")
      expect(peeps).to include("The last test peep")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'New peep')
      expect(Peep.all).to include 'New peep'
    end
  end
end
