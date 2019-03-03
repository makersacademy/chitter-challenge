require 'peeps'

describe Peeps do

  describe '.all' do
    it 'returns the list of peeps' do
      peeps = Peeps.all
      expect(peeps).to include("Hello!")
      expect(peeps).to include("Second peep")
    end
  end

  describe '.post' do
    it 'posts a new peep to the feed' do
      Peeps.post(message: 'Sunday brunch')
      expect(Peeps.all). to include 'Sunday brunch'
    end
  end


end
