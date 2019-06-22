require 'peep'

describe Peep do
  describe '.create' do
    it 'responds to create method' do
      expect(described_class).to respond_to(:create).with(1).argument
    end

    it 'create a new peep' do
      peep = Peep.create(content: 'Test message')
      expect(peep).to be_an_instance_of(Peep)
    end
  end 
end
