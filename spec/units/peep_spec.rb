require './lib/peep.rb'

describe '.create' do
  it 'creates a new peep' do
    peep = Peep.create("This is a test message", "TomChitter")
    expect(peep.message).to eq 'This is a test message'
    expect(peep.author).to eq 'TomChitter'
  end
end