require './lib/peep'

describe Peep do

  it 'returns all peeps, with times' do
    
    Peep.create(text: 'Peep #1')
    Peep.create(text: 'Peep #2')
    Peep.create(text: 'Peep #3')

    peeps = Peep.all

    expect(peeps.count).to eq 3
    expect(peeps.first.created_at).to be_a String
  end

  it 'creates a new peep' do

    Peep.create(text: 'Peep dis, yo!')

    expect(Peep.all.first.text).to eq 'Peep dis, yo!'
  end

end
