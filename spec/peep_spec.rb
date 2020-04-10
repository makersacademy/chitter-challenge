require 'peep'

describe Peep do
  
  describe '.create' do
    it 'A peep can be created' do
      Peep.create("First Peep")
      expect(Peep.peeps).to include "First Peep"
    end
  end

end