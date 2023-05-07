require 'chitter_repository'

def reset_chitters_table
  seed_sql = File.read('spec/seeds_chitters.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe ChitterRepository do
  before(:each) do 
    reset_chitters_table
  end

  it 'Gets all chitters in reverse order' do
    repo = ChitterRepository.new

    chitters = repo.all

    expect(chitters.length).to eq 3

    expect(chitters[0].id).to eq 3
    expect(chitters[0].peep).to eq 'dead'
    expect(chitters[0].created_at).to be_a(Time)

    expect(chitters[1].id).to eq 2
    expect(chitters[1].peep).to eq 'falling'
    expect(chitters[1].created_at).to be_a(Time)

    expect(chitters[2].id).to eq 1
    expect(chitters[2].peep).to eq 'flying solo'
    expect(chitters[2].created_at).to be_a(Time)

  end

  it 'creates a chitter' do
    repo = ChitterRepository.new

    new_chitter = Chitter.new
    new_chitter.peep = 'Gin'
    new_chitter.created_at = Time.now
    repo.create(new_chitter)

    chitters = repo.all

    expect(chitters.length).to eq(4)
    expect(chitters.first.peep).to eq('Gin')
    expect(chitters.first.created_at).to be_a(Time)
  end
end