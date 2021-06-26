require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps in reverse chronological order' do
      peeps = Peep.all

      expect(peeps).to include("Hello weekend!")
      expect(peeps).to include("I love Chitter!")
      expect(peeps).to include("Good Bye COVID-19!")
    end
  end
end
