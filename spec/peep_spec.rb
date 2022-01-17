require './database_connection_setup'

describe '.all' do
  it 'returns a list of peeps' do
    DatabaseConnection.query("INSERT INTO users (id) VALUES ($1)", [1])

    peep = Peep.create(message: 'Testing id', user_id: 1)
    Peep.create(message: 'Test peep 1', user_id: 1)
    Peep.create(message: 'Test peep 2', user_id: 1)
    Peep.create(message: 'Test peep 3', user_id: 1)

    peeps = Peep.all

    expect(peeps.size).to eq 4
    expect(peeps.first).to be_a Peep
    expect(peeps.first.message).to eq 'Test peep 3'
    expect(peeps.last.id).to eq peep.id
  end
end

describe '.create' do
  it 'creates a new peep' do
    DatabaseConnection.query("INSERT INTO users (id) VALUES ($1)", [1])
    peep = Peep.create(message: 'Testing, testing, 1, 2, 3', user_id: 1)
  
    expect(peep.message).to eq 'Testing, testing, 1, 2, 3'
  end 
end
