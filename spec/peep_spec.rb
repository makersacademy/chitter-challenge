require './lib/peep.rb'

describe '.create' do
  it 'creates a new peep' do
    Peep.create(peep: 'Peepy peep')
    expect(Peep.all).to include 'Peepy peep'
  end
end
