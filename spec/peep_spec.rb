require 'peep'

describe 'Peep' do
  describe '.all' do
    it 'returns all peeps in reverse chronological order' do
      peeps = Peep.all
      peep = peeps[0]
      expect(peep.message).to eq('The second ever peep')
    end
  end
end
