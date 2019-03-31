require './app/lib/peep'

describe Peep do

  it 'shows all the peeps' do
    peep = Peep.create(peep: 'This is a peep')
    Peep.create(peep: 'This is the second peep')
    Peep.create(peep: 'This is the third peep')

    peeps = Peep.all
    
    expect(peeps.length).to eq 3
    expect(peeps.first).to be_a Peep
    expect(peeps.first.id).to eq peep.id
    expect(peeps.first.peep).to eq 'This is a peep'

  end

  
end