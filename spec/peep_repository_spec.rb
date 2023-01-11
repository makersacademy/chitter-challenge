require_relative '../lib/peep'
require_relative '../lib/peep_repository'

def reset_tables
  seed_sql = File.read('spec/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do
    reset_tables
  end
  after(:each) do
    reset_tables
  end

  it 'lists all peeps in reverse chronological order' do

    repo = PeepRepository.new

    peeps = repo.all
    expect(peeps.length).to eq 7
    expect(peeps.first.content).to eq 'Checking in!'
    expect(peeps.last.content).to eq 'First peep on chitter!'
  end

end
