require './lib/peep'

describe Peep do
  describe '#all' do
    it 'should show all peeps' do
      expect(subject.all).to be_an Array
    end
  end
  describe '#add' do
    it 'should add a peep' do
      subject.add('I like Chitter', 'anders_codes')
      peeps = subject.all
      expect(peeps).to include 'I like Chitter'
    end
  end
end
