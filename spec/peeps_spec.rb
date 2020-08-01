require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all
      expect(peeps).to include 'Another great win for Liverpool!'
      expect(peeps).to include 'Wow, its a scorcher today'
      expect(peeps).to include 'Looking forward to be able to go to gigs again'
    end
  end
end
