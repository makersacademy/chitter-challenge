require 'peep'

describe Peep do
  describe '#create' do
    it 'creates a new peep' do
      peep = Peep.create('test name', "test peep")
      expect(peep).to be_a Peep
      expect(peep.display_name).to eq 'test name'
      expect(peep.peep).to eq 'test peep'
    end
  end
  
end