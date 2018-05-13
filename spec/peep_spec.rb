require 'peep'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include('Test peep 1')
      expect(peeps).to include('Test peep 2')
      expect(peeps).to include('Test peep 3')
    end
  end

  describe '#create' do
    it 'creates a new peep' do
      Peep.create(message: 'Another peep!')
      expect(Peep.all).to include 'Another peep!'
    end
  end
end
