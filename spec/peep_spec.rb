require 'peep'

describe Peep do
  describe '.create' do 
    it 'creates a peep' do
      Peep.create('Hello, World!')
      expect(Peep.show[0].peep).to eq 'Hello, World!'
    end

    it 'logs the time of creation' do
      Peep.create('Hello, World!')
      expect(Peep.show[0].peeped_at).to eq '31/12/1999 23:59'
    end
  end

  describe '.show' do
    it 'returns peeps in reverse order of creation' do
      Peep.create('One')
      Peep.create('Two')
      Peep.create('Three')
      expect(Peep.show.map { |x| x.peep }).to eq ['Three', 'Two', 'One']
    end
  end
end
