require_relative '../lib/peep.rb'

describe Peep do
  describe '.all' do
    it 'returns an array of peeps' do
      array = Peep.all
      expect(array).to be_an_instance_of(Array)
      expect(array[0]).to be_an_instance_of(Peep)
    end
    it 'returns the peeps in reverse chronological order' do
      expect(Peep.all[0].text).to eq('peep2')
      expect(Peep.all[1].text).to eq('peep1')
    end

  end

  describe '.create' do
    it 'creates a new entry in the peeps database' do
      Peep.create('peep3')
      expect(Peep.all[0].text).to eq('peep3')
    end
  end

  describe '#text' do
    it 'returns the correct text' do
      peep = Peep.all
      expect(peep[0].text).to eq('peep2')
    end
  end
end
