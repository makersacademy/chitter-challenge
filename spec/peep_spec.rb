require 'peep'

describe Peep do
  describe '#self.all' do
    it 'should return all peeps' do
      peeps = Peep.all
      messages = peeps.map(&:message)
      expect(messages).to include 'Message number 1'
      expect(messages).to include 'I am a message'
      expect(messages).to include 'So am I'
    end
  end
end
