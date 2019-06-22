require 'peep'

describe Peep do
  describe '.create' do
    it 'create a new peep' do      
      peep = Peep.create(content: 'Test message')
      expect(peep.content).to eq 'Test message'
      expect(peep).to be_an_instance_of(Peep)
    end
  end 
end
