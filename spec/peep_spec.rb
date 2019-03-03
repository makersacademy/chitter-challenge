require 'peep'

describe Peep do
  describe '.all' do
    it 'lists all peeps' do
      expect(Peep.all).to include('Trump is a nob', 'Code is cool', 'Save the turtles')
    end
  end

  describe '.create' do
    it 'can create a new peep' do
      Peep.create(peep: 'My bf is gr8')
      expect(Peep.all).to include('My bf is gr8')
    end
  end
end
