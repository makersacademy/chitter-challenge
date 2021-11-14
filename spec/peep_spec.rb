require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps).to include('This is my peep')
      expect(peeps).to include('Another peep')
      expect(peeps).to include('Third peep')
    end
  end
end
