require 'peep'

describe '.all' do
  it 'returns a list of peeps' do
    peeps = Peep.all

    expect(peeps).to include "Hello"
  end
end

describe '.create' do
  it 'creates a new peep' do
    Peep.create(peep: 'Good')

    expect(Peep.all).to include 'Good'
  end
end