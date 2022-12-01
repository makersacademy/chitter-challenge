require 'peep'
require 'peep_repository'

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
    
    expect(peeps.length).to eq(11)
    expect(peeps.first.content).to eq('Hello world!')
    expect(peeps.first.post_time).to eq('10:00')
    expect(peeps.first.account_id).to eq(1)
  end

  it 'finds one peep' do
    repo = PeepRepository.new

    peep = repo.find(8)
    
    expect(peep.id).to eq(8)
    expect(peep.content).to eq('I like turtles 🐢🐢🐢')
    expect(peep.post_time).to eq('11:01')
    expect(peep.account_id).to eq(5)
  end

  it 'creates a peep' do
    repo = PeepRepository.new

    new_peep = Peep.new
    new_peep.content = 'First day on here went well I reckon!'
    new_peep.post_time = '23:59'
    new_peep.account_id = 1
    repo.create(new_peep)

    peeps = repo.all

    expect(peeps.length).to eq(12)
    expect(peeps.last.content).to eq('First day on here went well I reckon!')
    expect(peeps.last.post_time).to eq('23:59')
    expect(peeps.last.account_id).to eq(1)
  end

  it 'deletes a peep' do
    repo = PeepRepository.new

    repo.delete(12)
    peeps = repo.all

    expect(peeps.length).to eq(11)
    expect(peeps.last.id).to eq(11)
  end
end