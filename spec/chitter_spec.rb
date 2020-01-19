require 'chitter'
require 'setup_test_database'

describe Chitter do  
  describe '.all' do
    it 'returns a list of the peeps' do
      first_peep = Chitter.create(peep: 'I am Shaun')
      Chitter.create(peep: 'I am 23')
      Chitter.create(peep: 'I am from Malaysia')

      peeps = Chitter.all

      expect(peeps.first.peep).to eq 'I am Shaun'
      expect(peeps.first.id).to eq first_peep.id
      expect(peeps[1].peep).to eq 'I am 23'
      expect(peeps[2].peep).to eq 'I am from Malaysia'   
    end
  end
end