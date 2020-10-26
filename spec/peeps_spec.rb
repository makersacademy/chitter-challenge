require 'peeps'

describe Peeps do

  it 'peeps to be able to store a peep' do
    peeps = Peeps.new
    peeps.add('This is my first peep!')
    peeps.add('This is my second peep!')
    expect(peeps.messages).to include 'This is my first peep!'
    expect(peeps.messages).to include 'This is my second peep!'
  end

  it 'stores in the database a new peep' do
    Peeps.add("peep peep peep")

    expect(Peeps.all).to include "peep peep peep"
  end

end