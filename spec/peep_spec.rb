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

  describe '#.create' do
    it 'adds to peeps table the message' do
      Peep.create('testing create method')
      expect(described_class.all).to include('testing create method')
    end
  end

end
