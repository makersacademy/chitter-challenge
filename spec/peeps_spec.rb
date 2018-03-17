require 'peeps'
require 'pg'

describe 'Peeps' do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all
      expect(peeps).to include("What a beautiful morning!")
      expect(peeps).to include("Back on terra firma.")
      expect(peeps).to include("Free as a bird.")
    end
  end
end
