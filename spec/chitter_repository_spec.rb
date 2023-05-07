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

  it 'Gets all chitters' do
    repo = ChitterRepository.new

    chitters = repo.all

    expect(chitters.length).to eq 3

    expect(chitters[0].id).to eq 1
    expect(chitters[0].peep).to eq 'flying solo'
    expect(chitters[0].peep_time).to eq '16:20:00'

    expect(chitters[1].id).to eq 2
    expect(chitters[1].peep).to eq 'falling'
    expect(chitters[1].peep_time).to eq '16:21:00'
  end

  it 'Gets all chitters in reverse order' do
    repo = ChitterRepository.new

    ordered = repo.order

    expect(ordered[0].peep_time).to eq '16:22:00'
    expect(ordered[1].peep_time).to eq '16:21:00'
    expect(ordered[2].peep_time).to eq '16:20:00'
    expect(ordered[2].peep).to eq 'flying solo'
  end
end