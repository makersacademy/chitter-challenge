require 'peep'
require 'peep_repository'

def reset_tables
  seed_peeps_sql = File.read('spec/seeds_peeps.sql')
  seed_users_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_peeps_sql)
  connection.exec(seed_users_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_tables
  end

  # (your tests will go here).

  it 'returns all peeps' do
    repo = PeepRepository.new
    expect(repo.all.length).to eq(9)
    expect(repo.all.last.peep_content).to eq('Hello Chitterers!')
  end

  it 'creates new peep' do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.peep_content = 'Carry on!'
    new_peep.time_posted = 'Sun Jan 15 2023 23:26:28'
    new_peep.user_id = '1'

    repo.create(new_peep)  #=> nil
    peeps = repo.all
    expect(peeps.length).to eq(10)
    expect(peeps.last.time_posted).to include('23:26:28')
    expect(peeps.last.user_id).to eq('1')
    expect(peeps.last.peep_content).to eq('Carry on!')
  end

  it 'finds a peep' do
    repo = PeepRepository.new
    peep = repo.find(2)
    expect(peep.peep_content).to eq('Have a great weekend!')
    expect(peep.time_posted).to include('17:35:10')
    expect(peep.user_id).to eq('2')
  end
end
