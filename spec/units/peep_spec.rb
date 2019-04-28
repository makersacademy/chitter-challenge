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


end
