require 'peeps'

describe Peeps do

  it 'stores in the database a new peep' do
    Peeps.add("why hello there")

    messages = Peeps.all
    
    messages.each do |peep|
      expect(peep.peep).to include "why hello there"
    end
  end
  
end
