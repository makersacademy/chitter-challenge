require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      
      Peep.create(content: "This is the first peep", name: 'testname', username: 'testusername')
      Peep.create(content: "This is the second peep", name: 'testname', username: 'testusername')

      peeps = Peep.all

      expect(peeps.length).to eq 2
    end
  end

  describe '.create' do
    it 'creates a new peep' do

      Peep.create(content: 'This is a test peep', name: 'testname', username: 'testusername')

      peeps = Peep.all
      peepss = peeps.map { |peep| peep }
      expect(peepss[0]['content']).to eq 'This is a test peep'

    end
  end
end
