require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all Peeps' do
      peeps = Peep.all

      expect(peeps).to include('Test Peep')
      expect(peeps).to include('I am a test peep')
      expect(peeps).to include('Me too')
    end
  end
end