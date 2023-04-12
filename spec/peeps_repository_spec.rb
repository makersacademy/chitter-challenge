require 'peeps'
require 'peeps_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_seed.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do
    reset_tables
  end

  it 'returns all peeps in reverse chronological order' do
    repo = PeepRepository.new

    peeps = repo.all
    expect(peeps.length).to eq(6)
    expect(peeps.last.content).to eq('Hello, world!')
    expect(peeps.last.user_id).to eq(1)
    expect(peeps.last.created_at).to eq('2022-04-09 10:00:00')
    expect(peeps.last.username).to eq('orangeman')
  end

  it 'creates a new peep' do
    repo = PeepRepository.new

    repo.create(content: 'New test peep', user_id: 1)

    peeps = repo.all
    p peeps
    expect(peeps.length).to eq(7)
    expect(peeps.first.content).to eq('New test peep')
    expect(peeps.last.user_id).to eq(1)
    expect(peeps.last.username).to eq('orangeman')
  end
end