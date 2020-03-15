  require 'peep.rb'

  describe Peep do 
    describe '.read' do 
      it 'returns all peeps in reverse chronological order' do
        peeps = Peep.read
        
        expect(peeps).to include("Peep 1")
        expect(peeps).to include("Peep 2")
        expect(peeps).to include("Peep 3")

      end
    end
  end

# Change method all method to read?