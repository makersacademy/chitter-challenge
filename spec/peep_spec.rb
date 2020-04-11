require 'peep'

describe Peep do
  
  describe '.create' do
    it 'A peep can be created' do
      peep = Peep.create("First Peep")
       
      expect(peep).to be_a Peep
      expect(peep.peep).to eq "First Peep"
    end
  end

  describe '.all' do
    it 'peeps can be views' do
      Peep.create("First Peep")
      Peep.create("Second Peep")
      expect(Peep.all).to eq ["First Peep", "Second Peep"]
    end
  end

end