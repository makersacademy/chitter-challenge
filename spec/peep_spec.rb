require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps in an array' do
      peep_1 = Peep.create(comment: 'Wow cool peep')
      peep_2 = Peep.create(comment: 'It is a Twitter clone')
      peep_3 = Peep.create(comment: 'Call it Chitter')


      expect(Peep.all).to include('Wow cool peep')
      expect(Peep.all).to include('It is a Twitter clone')
      expect(Peep.all).to include('Call it Chitter')

    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(comment: "this is a peep")
      expect(Peep.all).to include("this is a peep")
    end
  end

end
