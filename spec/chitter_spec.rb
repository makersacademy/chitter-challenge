describe '.all' do
  it 'returns a list of peeps' do
    chitter = ChitterNew.all

    expect(chitter).to include "hello, everyone"
  end
end

describe '.create' do
  it 'creates a new peep' do
    ChitterNew.create(url: "whats up")

    expect(ChitterNew.all).to include 'whats up'
  end
end