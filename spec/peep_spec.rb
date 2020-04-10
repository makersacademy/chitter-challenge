require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of all peeps' do
      peeps = Peep.all
      expect(peeps.length).to eq 2
      expect(peeps[0]).to eq 'First peep'
      expect(peeps[1]).to eq 'Second peep' 
    end
  end
end