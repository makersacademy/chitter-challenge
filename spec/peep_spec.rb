require 'peep'

describe Peep do

  describe '#post' do
    it 'posts a new peep' do
      peep = Peep.post(peep: "Hey guys! I'm new")

      expect(peep).to be_a Peep
      expect(peep.message).to eq "Hey guys! I'm new"
    end
  end

  describe '#all' do
    it 'shows all of the peeps' do
      peep = Peep.post(peep: "Hey guys! I'm new")
      peep = Peep.post(peep: "Hey new! I'm Peeper")
      peeps = Peep.all
      expect(peeps).length to eq(2)
    end
  end

end

