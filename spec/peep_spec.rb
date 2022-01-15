require 'db_helpers'

describe '.all' do
  it 'returns all peeps in order of most recent' do

    add_three_peeps
    newest_peep = Peep.create_peep(message: 'NEWEST PEEP')

    peeps = Peep.all
    

    expect(peeps.length).to eq 4
    expect(peeps[0].id.to_i - peeps[-1].id.to_i).to eq 3
    expect(peeps.first).to be_a(Peep)
    expect(peeps.first.id).to eq(newest_peep.id)
    expect(peeps.first.message).to eq('NEWEST PEEP')
  end
end

describe '.create_peep' do
  it "allows the Maker to write and post a new message (peep)" do
    peep = Peep.create_peep(message: 'my new peep')
    persisted_data = persisted_data(id: peep.id)

    expect(peep).to be_a(Peep)
    expect(peep.id).to eq(persisted_data['id'])
    expect(peep.message).to eq('my new peep')
  end
end
