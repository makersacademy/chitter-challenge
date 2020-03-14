require 'peep'

describe Peep do

  describe ".all" do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

       Peep.create(peep: 'this is a peep about a cat')
       Peep.create(peep: 'the cat is soft and fluffy')
       Peep.create(peep: 'and if you die, it will eat your face')

      peeps = Peep.all

      expect(peeps).to include('this is a peep about a cat')
      expect(peeps).to include('the cat is soft and fluffy')
      expect(peeps).to include('and if you die, it will eat your face')
    end
  end

  describe ".create" do
    it "creates a new peep" do
      Peep.create(peep: 'this is a new peep')

      expect(Peep.all).to include 'this is a new peep'
    end
  end

end
