require 'peep'

describe Peep do
  describe '.create' do 
    it 'creates a peep' do
      Peep.create('Hello, World!')
      expect(Peep.show).to eq ['Hello, World!']
    end
  end

  describe '.show' do
    it 'returns peeps in reverse order of creation' do
      Peep.create('One')
      Peep.create('Two')
      Peep.create('Three')
      expect(Peep.show).to eq ['Three', 'Two', 'One']
    end
  end
end