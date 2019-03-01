require './lib/peep'

describe Peep do

  it 'returns all peeps' do
    
    peeps = Peep.all

    expect(peeps).to include 'Peep #1'
  end

  it 'creates a new peep' do

    Peep.create(text: 'Peep dis, yo!')

    expect(Peep.all).to include 'Peep dis, yo!'
  end

end
