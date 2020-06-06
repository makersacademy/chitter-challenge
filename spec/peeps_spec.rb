require 'peep'

describe Peep do
  
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all

      expect(peeps.length).to eq 3
    end
  end

end