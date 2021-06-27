require 'peep'

describe Peep do

  describe '.create' do
    it 'creates a peep' do
      peep = Peep.create(peep: 'This is a test peep')
  
      expect(peep).to be_a Peep
      expect(peep.peep).to eq 'This is a test peep'
    end
  end

end
    
