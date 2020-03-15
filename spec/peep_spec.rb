require 'peep'

describe Peep do

  describe ".all" do
    it 'returns peeps in reverse chronologial order' do
      PG.connect(dbname: 'chitter_test')

      Peep.create(peep: 'this is a peep about a cat')
      Peep.create(peep: 'the cat is soft and fluffy')
      Peep.create(peep: 'and if you die, it will eat your face')

      peeps = Peep.all

      expect(peeps.first).to eq('and if you die, it will eat your face')
      expect(peeps.last).to eq('this is a peep about a cat')
    end
  end

  describe ".create" do
    it "creates a new peep" do
      Peep.create(peep: 'this is a new peep')

      expect(Peep.all).to include 'this is a new peep'
    end
  end

end
