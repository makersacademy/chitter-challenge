require 'chitter'

describe Chitter do
  let(:peep_double) {double('This is a test peep')}

  describe '.add' do
    it 'adds a peep to chitter' do
      chitter = Chitter.add(peep: peep_double)
      expect(chitter).to be_a Chitter
      expect(chitter.peep).to include 'This is a test peep'
      expect(chitter.time).to eq chitter.time
    end
  end

  describe '.all' do
    it 'returns all the peeps' do
    end
  end
  
end