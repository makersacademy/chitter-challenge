require 'peep'

describe Peep do

  describe '#.all' do
    it 'returns all peeps stored' do
      peeps = Peep.all
      expect(peeps).to include('first peep test')
      expect(peeps).to include('second peep test')
      expect(peeps).to include('third peep test')
    end
  end

end
