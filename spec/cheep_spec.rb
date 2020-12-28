require 'cheep'

describe Cheep do
  describe '.all' do
    it 'returns all cheeps' do
      cheeps = Cheep.all

      expect(cheeps).to include("First cheep")
      expect(cheeps).to include("Second cheep")
      expect(cheeps).to include("Third cheep")
    end
  end
end