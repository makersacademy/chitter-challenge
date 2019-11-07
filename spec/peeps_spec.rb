require 'peeps'

describe Peeps do
  describe '.create' do
    it 'creates a new peep' do
      Peeps.add(peep: 'My first Peep!')

      expect(Peeps.all).to include 'My first Peep!'
    end
  end
end
