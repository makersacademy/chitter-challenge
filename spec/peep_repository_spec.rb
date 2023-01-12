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

  it 'creates new peep and adds to the repository' do
    repo = PeepRepository.new
    peeps = repo.all

    expect(peeps.length).to eq 7
    expect(peeps.last.timestamp).to eq '2023-01-11 09:40:00'

    new_peep = Peep.new
    new_peep.content = 'Late to the party but love it.'
    new_peep.timestamp = '2023-01-11 10:40:00'
    new_peep.user_id = 4
    repo.create(new_peep)
    updated_peeps = repo.all

    expect(updated_peeps.length).to eq 8
    expect(updated_peeps.first.content).to eq 'Late to the party but love it.'
    expect(updated_peeps.first.timestamp).to eq '2023-01-11 10:40:00'

  end

  it 'finds peeps by user id' do
    repo = PeepRepository.new
    expect(repo.find_by_user(1)[0].content).to eq 'Third peep on chitter!'
    expect(repo.find_by_user(2).length).to eq 1
  end
end
