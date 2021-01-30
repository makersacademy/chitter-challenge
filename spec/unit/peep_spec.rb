require 'peep'

describe '.all' do
  it 'returns a list of peeps' do

    peep = Peep.create('Peep 1')
    Peep.create('Peep 2')
    Peep.create('Peep 3')

    peeps = Peep.all

    expect(peeps.length).to eq 3
    expect(peeps.first).to be_a Peep
    expect(peeps.first.message).to eq 'Peep 1'
  end
end

describe '.create' do
  it 'creates a new peep' do
    Peep.create('This is a new peep')

    peeps = Peep.all
    expect(peeps.first.message).to eq 'This is a new peep'
  end
end
