require_relative '../lib/peep.rb'

describe Peep do
  describe '.all' do
    it 'returns an array of peeps' do
      array = Peep.all
      expect(array).to be_an_instance_of(Array)
      expect(array[0]).to be_an_instance_of(Peep)
    end
  end

  describe '#text' do
    it 'returns the correct text' do
      peep = Peep.all
      expect(peep[0].text).to eq('peep1')
    end
  end
end
