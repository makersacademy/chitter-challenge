require 'chitter'

describe Peep do
  it 'will return a list of peeps' do
    peep = Peep.add(id: 1, body: "This is a test peep", time: '12:30')
    expect(peep.body).to eq 'This is a test peep'
  end
end