require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps, wrapped in peep instances' do
      feed = Peep.all
      peeps = feed.map(&:message)
      expect(peeps).to include('My first peep!')
    end
  end

end
