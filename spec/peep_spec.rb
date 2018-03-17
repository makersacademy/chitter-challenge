require 'peep'

describe Peep do
  describe '#self.all' do
    it 'should return all peeps' do
      peeps = Peep.all
      expect(peeps).to include 'Message number 1'
      expect(peeps).to include 'I am a message'
      expect(peeps).to include 'So am I'
    end
  end
end
