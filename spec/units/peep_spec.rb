require 'peep'

describe Peep do

  describe '.all' do
    it 'returns a full list of peeps' do
      peeps = Peep.all
      expect(peeps).to include "My first peep!"
      expect(peeps).to include "Wow, this is my second peep!"
      expect(peeps).to include "THIS IS MY THIRD PEEP, I can't believe it!!!"
    end
  end

  describe '.new' do
    it 'adds a new peep to the list of peeps' do
      peep = Peep.new("Chitter rocks!")
      expect(Peep.all).to include "Chitter rocks!"
    end
  end

end
