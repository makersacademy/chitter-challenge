require 'peep'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include("My 1st peep")
      expect(peeps).to include("My 2nd peep")
      expect(peeps).to include("My 3rd peep")
    end
  end
  describe '#create' do
    it 'creates a new peep' do
      Peep.create(message: "Hello World!")
      expect(Peep.all).to include "Hello World!"
    end
  end
end
