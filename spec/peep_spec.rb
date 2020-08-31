require 'peep'

describe Peep do

  describe '#.all' do
    it 'returns all peeps stored' do
      Peep.create('first peep test')
      Peep.create('second peep test')
      Peep.create('third peep test')
      peeps = Peep.all
      expect(peeps).to include('first peep test')
      expect(peeps).to include('second peep test')
      expect(peeps).to include('third peep test')
    end

    it 'returns peeps in reverse order' do
      Peep.create('first peep test')
      Peep.create('second peep test')
      Peep.create('third peep test')
      peeps = Peep.all
      expect(peeps.first).to eq('third peep test')
      expect(peeps[1]).to eq('second peep test')
      expect(peeps.last).to eq('first peep test')

    end
  end

  describe '#.create' do
    it 'adds to peeps table the message' do
      Peep.create('testing create method')
      expect(described_class.all).to include('testing create method')
    end
  end

end
