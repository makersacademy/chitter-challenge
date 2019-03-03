require 'peep'

describe 'Peep' do
  describe '.all' do
    it 'returns all peeps in reverse chronological order' do
      peeps = Peep.all
      peep = peeps[0]
      expect(peep.message).to eq('The second ever peep')
    end
  end
  describe '.add' do
    it 'adds a new message to the peeps table' do
      peep = "feature testing posting a peep"
      Peep.add(peep)
      expect(Peep.all.first.message).to eq(peep)
    end
  end
  # it 'gets the Maker details for the makerid' do
  #
  # end
end
