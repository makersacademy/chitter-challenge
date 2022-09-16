require 'peep'
require 'peep_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/seeds_tests.sql')
  user = ENV['PGUSER1']
  password = ENV['PGPASSWORD']
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test', user: user, password: password })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_tables
  end

  it '#all returns all peeps' do
    repo = PeepRepository.new
    peeps = repo.all
    
    expect(peeps.length).to eq(8)
    expect(peeps.first.id).to eq(1)
    expect(peeps.first.content).to eq('Hello, I am Wendy!')
    expect(peeps.first.date_time).to eq('2022-01-01 01:01:01')
    expect(peeps.first.user_f_name).to eq('Wendy')
    expect(peeps.first.user_handle).to eq('wendy0')    
  end

  it '#find returns one peep specified by id' do
    repo = PeepRepository.new
    peep = repo.find(4)
    
    expect(peep.id).to eq(4)
    expect(peep.content).to eq('Could I BE more sorry?')
    expect(peep.date_time).to eq('2022-04-04 04:04:04')
    expect(peep.user_f_name).to eq('Chandler')
    expect(peep.user_handle).to eq('chandler0')
  end

  it '#create creates a peep' do
    peep = Peep.new
    peep.content = ('Peep 9')
    peep.date_time = ('2022-09-09 09:09:09')
    peep.user_f_name = ('Rob')
    peep.user_handle = ('rob0')

    repo = PeepRepository.new
    repo.create(peep)
    peeps = repo.all

    expect(peeps.length).to eq(9)
    expect(peeps.last.id).to eq(9)
    expect(peeps.last.content).to eq('Peep 9')
    expect(peeps.last.date_time).to eq('2022-09-09 09:09:09')
    expect(peeps.last.user_f_name).to eq('Rob')
    expect(peeps.last.user_handle).to eq('rob0')
  end
end