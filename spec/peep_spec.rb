require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps posted' do
      peeps = Peep.all

      expect(peeps).to include("Hello World!")
      expect(peeps).to include("I am feeling sunny today!")
      expect(peeps).to include("Minions will takeover the world.")
    end
  end
end
