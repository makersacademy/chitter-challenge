require 'peep'

describe Peep do
  it '.all returns a list of peeps' do
    peeps = Peep.all

    expect(peeps).to include 'i need a holiday'
    expect(peeps).to include 'look at my cat'
    expect(peeps).to include 'HUNGRY'
  end
end
