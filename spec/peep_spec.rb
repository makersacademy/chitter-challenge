describe '.all' do
  it 'returns a list of peeps' do
  
    Peep.create(peep: 'Salut!')
    Peep.create(peep: 'Ca farte?!')

    peeps = Peep.all

    expect(peeps).to include "Salut!"
    expect(peeps).to include "Ca farte?"
  end

  it 'returns a list of reversed peeps' do
    
    Peep.create(peep: 'Salut!')
    Peep.create(peep: 'Ca farte?!')

    peeps = Peep.all

    expect(peeps.first).to eq "Ca farte?"
    expect(peeps.last).to eq "Salut!"
  end
end

describe '.create' do
  it 'creates a new peep' do
    Peep.create(peep: 'Kikoo!')

    expect(Peep.all).to include 'Kikoo!'
  end
end
