require 'peep'

describe '.all' do
  it 'returns a list of peeps' do
    peeps = Peep.all

    expect(peeps).to include 'Peep 1'
    expect(peeps).to include 'Peep 2'
    expect(peeps).to include 'Peep 3'
  end
end
