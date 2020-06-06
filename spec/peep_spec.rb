require 'peep'

describe Peep do

describe '.all' do
  it 'returns a list of peeps' do
    peeps = Peep.all

    expect(peeps).to include 'i need a holiday'
    expect(peeps).to include 'look at my cat'
    expect(peeps).to include 'HUNGRY'

    end
  end
end
