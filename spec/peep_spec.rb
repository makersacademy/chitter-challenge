require 'peep'

describe Peep do
  
  describe '.create' do
    it 'A peep can be created' do
      Peep.create("First Peep")
      expect(Peep.all).to include "First Peep"
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