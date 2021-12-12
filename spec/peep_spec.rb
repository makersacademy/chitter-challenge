require 'peep'

describe Peep do 
  describe '.all' do 
    it 'returns all the peeps' do
       peeps = Peep.all

       expect(peeps).to include("Example peep posted at 3pm")
       expect(peeps).to include("Example peep posted at 2pm")
       expect(peeps).to include("Example peep posted at 1pm")
    end 
  
  
  end 

end 