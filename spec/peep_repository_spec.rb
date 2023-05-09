require_relative '../lib/peep_repository'

def reset_peeps_table
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  it 'Returns all (2) peeps' do
    repo = PeepRepository.new

    peeps = repo.all

    expect(peeps.length).to eq 2

    expect(peeps[0].id).to eq '1'
    expect(peeps[0].content).to eq 'My very first peep!'
    expect(peeps[0].time).to eq '2023-05-05 19:10:25'
    expect(peeps[0].user_id).to eq '1'

    expect(peeps[1].id).to eq '2'
    expect(peeps[1].content).to eq 'This is better than twitter'
    expect(peeps[1].time).to eq '2023-05-09 09:55:01'
    expect(peeps[1].user_id).to eq '2'
  end

  it 'Finds peep by id' do
    repo = PeepRepository.new

    peep = repo.find(1)

    expect(peep.id).to eq '1'
    expect(peep.content).to eq 'My very first peep!'
    expect(peep.time).to eq '2023-05-05 19:10:25'
    expect(peep.user_id).to eq '1'
  end

  it 'Creates a new peep' do
    new_peep = Peep.new
    new_peep.content = 'I will peep non-stop'
    new_peep.time = '2023-05-09 15:01:23'
    new_peep.user_id = '2'
    repo = PeepRepository.new
    repo.create(new_peep)
    peeps = repo.all

    expect(peeps[-1].content).to eq 'I will peep non-stop'
    expect(peeps[-1].time).to eq '2023-05-09 15:01:23'
    expect(peeps[-1].user_id).to eq '2'
  end
end
