require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include("Posting peeps is so much fun!")
      expect(peeps).to include("Loving this new database stuff")
    end
  end
end