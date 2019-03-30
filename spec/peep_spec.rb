require 'peep'

describe Peep do
  describe '.all' do
    it 'returns the peepdeck' do
      peepdeck = Peep.all

      expect(peepdeck).to include('My first peep!')
    end
  end
end
