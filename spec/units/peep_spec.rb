require './lib/peep.rb'

describe '.create' do
  it 'creates a new peep' do
    peep = Peep.create("This is a test message", "TomChitter")
    expect(peep.message).to eq 'This is a test message'
    expect(peep.author).to eq 'TomChitter'
  end
end

describe '.all' do

  it 'returns all peeps' do
    create_peeps
    feed = Peep.all
    expect(feed.last).to be_a Peep
    expect(feed.last.message).to eq "Making a delicious Sunday Roast!"
    expect(feed.last.author).to eq "Toms Mum"
  end
end