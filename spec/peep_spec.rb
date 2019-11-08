require './lib/peep'

describe '.all' do
  it 'returns a list of peeps' do
    peeps = Peep.all

    expect(peeps).to include "My first peep"
    expect(peeps).to include "My second peep"
  end
end