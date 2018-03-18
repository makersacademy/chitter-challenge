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

  describe '.post' do
    it 'posts a new peep' do
      Peeps.post("A short message")      
      expect(Peeps.all).to include("A short message")
    end
  end
end
