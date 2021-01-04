require 'chitter'

describe Peep do
  it 'will return a list of peeps' do
    peep = Peep.add(body: "This is a peep")
    expect(peep.body).to eq "This is a peep"
  end
end