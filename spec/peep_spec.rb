describe '.all' do
  it 'returns all peeps in order of most recent' do
    add_three_peeps

    expect(Peep.all).to include("peep: 1")
    expect(Peep.all).to include("peep: 2")
    expect(Peep.all).to include("peep: 3")
  end
end

describe '.create_peep' do
  it "allows the Maker to write and post a new message (peep)" do
    Peep.create_peep(message: 'my new peep')

    expect(Peep.all).to include('my new peep')
  end
end
