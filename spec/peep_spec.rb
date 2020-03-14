require 'peep'

describe Peep do
  describe '.all' do
    it 'returns the list of peeps' do
      peeps = Peep.all

      expect(peeps).to include('peep test 1')
      expect(peeps).to include('peep test 2')
      expect(peeps).to include('peep test 3')

    end
  end
end
