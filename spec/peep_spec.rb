require 'peep'

describe Peep do
  describe '#all' do
    it 'returns a list of all peeps' do
      peeps = Peep.all
      expect(peeps).to include 'This is a test peep!'
    end
  end

  describe '#post' do
    it 'creates a new peep' do
      Peep.post("This is another test peep!")
      expect(Peep.all).to include 'This is another test peep!'
    end
  end
end
