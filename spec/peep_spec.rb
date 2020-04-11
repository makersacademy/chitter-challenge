require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      # add test data
      Peep.create(content: 'This is so cool')
      Peep.create(content: 'I am sending a peep')
      Peep.create(content: 'Isolation #COVID-19')

      peeps = Peep.all

      expect(peeps[0][:content]).to eq 'Isolation #COVID-19'
      expect(peeps[1][:content]).to eq 'I am sending a peep'
      expect(peeps[2][:content]).to eq 'This is so cool'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(content: 'this is a test peep')
      
      test_peep = Peep.all.first

      expect(test_peep[:content]).to eq 'this is a test peep'
    end
  end
  
end