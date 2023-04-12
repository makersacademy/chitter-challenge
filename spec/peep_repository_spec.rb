require 'peep'
require 'peep_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do
    reset_tables
  end

  it 'finds all peeps in reverse chronological order' do
    repo = PeepRepository.new
    peeps = repo.all

    expect(peeps.length).to eq 2
    expect(peeps.first.content).to eq "Hello Chitter."
    expect(peeps.first.id).to eq '2'
    expect(peeps.first.user_id).to eq '2'
  end

  it 'creates a new peep' do
    repo = PeepRepository.new

    new_peep = Peep.new
    new_peep.time = '2023-01-01 15:30:00'
    new_peep.content = 'Peeps are cool'
    new_peep.user_id = '2'
    repo.create(new_peep)

    peeps = repo.all

    expect(peeps.length).to eq 3
    expect(peeps.last.time).to eq '2023-01-01 15:30:00'
    expect(peeps.last.content).to eq 'Peeps are cool'
    expect(peeps.last.user_id).to eq '2'
    expect(peeps.last.id).to eq '3'
  end
end
