require 'peeps'

describe Peeps do

  it 'stores in the database a new peep' do
    Peeps.add("why hello there")

    expect(Peeps.all).to include "why hello there"
  end
  
end
