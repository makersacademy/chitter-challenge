require './lib/peep'

describe Peep do
  describe '#all' do
    it 'should show all peeps' do
      expect(Peep.all).to be_an Array
    end
  end
  describe '#add' do
    it 'should add a peep' do
      Peep.add('I like Chitter', 'anders_codes')
      peeps = Peep.all
      expect(peeps.last.peep).to include 'I like Chitter'
    end
  end
end
