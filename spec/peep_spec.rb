require 'peep'

describe Peep do

  describe '#.all' do
    it 'returns all peeps stored within class' do
      Peep.create('first peep test')
      Peep.create('second peep test')
      test_peep = Peep.create('third peep test')
      peeps = Peep.all
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq(test_peep.id)
      expect(peeps.first.message).to eq('third peep test')
      expect(peeps.first.timestamp).to eq("#{Time.now.strftime('%d-%m-%Y %H:%M:%S')}")
    end

    it 'returns peeps in reverse order' do
      Peep.create('first peep test')
      Peep.create('second peep test')
      Peep.create('third peep test')
      peeps = Peep.all
      expect(peeps.first.message).to eq('third peep test')
      expect(peeps[1].message).to eq('second peep test')
      expect(peeps.last.message).to eq('first peep test')
    end
  end

  describe '#.create' do
    it 'adds to peeps table the message' do
      peep = Peep.create('testing create method')
      expect(peep).to be_a Peep
      expect(peep.message).to eq('testing create method')
      expect(peep.timestamp).to eq(Time.now.strftime('%d-%m-%Y %H:%M:%S'))
    end
  end

end
