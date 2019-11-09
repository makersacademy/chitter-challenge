require 'peep'

describe '.all' do
  it 'returns a list of peeps' do
    peeps = Peep.all

    expect(peeps).to include "This is my first peep"
  end
end
