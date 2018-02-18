require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps, wrapped in peep instances' do
      feed = Peep.all
      peeps = feed.map(&:message)
      expect(peeps).to include('My first peep!')
    end
  end

  describe '.add' do
    it 'posts a new peep to the feed' do
      Peep.add('A new peep!')
      feed = Peep.all
      peeps = feed.map(&:message)
      expect(peeps).to include('A new peep!')
    end
  end

end
