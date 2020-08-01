require 'peep'

describe Peep do

  describe '.all' do
    it 'returns a list of peeps' do
      Peep.create('Test peep text')
      peeps = Peep.all
      
      expect(peeps).to be_an(Array)
      expect(peeps.first).to be_a Peep
    end
  end

  describe '.create' do
    it 'adds a new peep to the database' do
      peep = Peep.create("Test peep text")

      expect(peep).to be_a Peep
      expect(Peep.all.length).to eq 1
    end
  end
end
