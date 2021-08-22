require 'peeps'

describe '.all' do
  it 'returns all peeps from database' do
    PG.connect(dbname: 'chitter_test')
    Peep.create(post_time: '14:59:00', message: 'Test peep', username: 'Joe') 

    peeps = Peep.all
    expect(peeps.length).to eq 1
    expect(peeps.first.post_time).to eq '14:59:00'
    expect(peeps.first.message).to eq 'Test peep'
    expect(peeps.first.username).to eq 'Joe'
  end
end

describe '.create' do
  it 'create a new peep' do
    peep = Peep.create(post_time: '15:00:00', message: 'Example peep', username: 'Bob')

    expect(peep.post_time).to eq '15:00:00'
    expect(peep.message).to eq 'Example peep'
    expect(peep.username).to eq 'Bob'
  end
end
