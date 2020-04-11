require 'peep'

describe Peep do
  it '.all returns a list of peeps' do
    peeps = Peep.all

    expect(peeps).to include 'This is so cool'
    expect(peeps).to include 'I am sending a peep'
    expect(peeps).to include 'Isolation #COVID-19'
  end
end