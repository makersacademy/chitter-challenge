
require 'peep'

describe Peep do

  describe '.all' do 
    it 'returns all the peeps' do
      Peep.create(peep_body: 'Example peep posted at 3pm')
      Peep.create(peep_body: 'Example peep posted at 2pm')
      Peep.create(peep_body: 'Example peep posted at 1pm')

      peeps = Peep.all

      expect(peeps).to include("Example peep posted at 3pm")
      expect(peeps).to include("Example peep posted at 2pm")
      expect(peeps).to include("Example peep posted at 1pm")
    end 
  end 

  describe '.create' do 
    it 'creates a new peep' do
      Peep.create(peep_body: 'Example peep from 5pm')
  
      expect(Peep.all).to include 'Example peep from 5pm'
    end
  end 

end
