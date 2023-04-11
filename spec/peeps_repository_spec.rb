require 'peeps'
require 'peeps_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_seed.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

before(:each) do
  reset_tables
end

describe PeepRepository do
  it 'returns all peeps in reverse chronological order' do
    repo = PeepRepository.new

    peeps = repo.all

    expect(peeps.length).to eq(6)
    expect(peeps.last.content).to eq('Hello World!')
    expect(peeps.last.user_id).to eq(1)
  end
end