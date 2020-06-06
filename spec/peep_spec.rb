require 'peep'

describe Peep do

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    peep = Peep.create(peep: 'This is my first peep!')
    peeps = Peep.all
    expect(peeps.length).to eq 1
    expect(peeps.first).to be_a Peep
    expect(peeps.first.peep).to eq 'This is my first peep!'
  end
end

describe '.create' do
  it 'creates a new peep' do
    Peep.create(peep: 'Test peep')
    expect(Peep.all).to include "Test peep"
  end
end

end