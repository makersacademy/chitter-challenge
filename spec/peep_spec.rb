require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include('Hello I am a peep!')
      expect(peeps).to include('I too am a peep!')
    end
  end
end