require 'peep'
require 'peep_repository'
require 'database_connection'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  it 'finds all peeps' do
    repo = PeepRepository.new
    peeps = repo.all
    expect(peeps.length).to eq(4)
    expect(peeps.first.content).to eq('Elon Musk is crazy')
    expect(peeps.first.user_id).to eq(1)
    expect(peeps.first.peep_date).to eq('2022-07-31 23:59:59+01')
  end

  it 'finds one peep' do
    repo = PeepRepository.new
    peep = repo.find(3)
    expect(peep.id).to eq(3)
    expect(peep.content).to eq('Tories suck')
    expect(peep.user_id).to eq(2)
    expect(peep.peep_date).to eq('2021-10-04 12:04:22+01')
  end

  it 'creates a peep' do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.id = 5
    new_peep.content = 'where is my mind?'
    new_peep.peep_date = '2022-04-07 16:07:07+01'
    new_peep.tags = '#balloons #friedpages'
    new_peep.user_id = 2
    repo.create(new_peep)
    peeps = repo.all
    expect(peeps.length).to eq(5)
    expect(peeps.last.content).to eq('where is my mind?')
    expect(peeps.last.user_id).to eq(2)
  end

  it 'deletes a peep' do
    repo = PeepRepository.new
    repo.delete(1)
    peeps = repo.all
    expect(peeps.length).to eq(3)
    expect(peeps.first.id).to eq(2)
  end
end
