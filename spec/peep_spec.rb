require 'peep'

describe Peep do
  describe '.create' do
    it 'can create a new peep' do
      Peep.create(peep: 'My bf is gr8')
      expect(Peep.all).to include('My bf is gr8')
    end
  end
end
