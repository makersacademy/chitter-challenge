require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include('Hello world! First peep!')
      expect(peeps).to include('My second peep!')
      expect(peeps).to include('Third time lucky!')
    end
  end
end
