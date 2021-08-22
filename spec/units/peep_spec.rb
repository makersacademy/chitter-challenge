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
    expect(feed.length).to eq 2
    expect(feed.last).to be_a Peep
    expect(feed.first.message).to eq "Nobody has better respect for intellegence than Donald Trump", "Donald Trump"
    expect(feed.first.author).to eq "Donald Trump"
  end
end