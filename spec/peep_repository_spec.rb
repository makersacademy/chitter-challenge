require 'peep'
require 'peep_repository'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'peeps_database_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  it 'finds all peeps' do
    repo = PeepRepository.new

    peeps = repo.all
    
    expect(peeps.length).to eq(5)
    expect(peeps.first.title).to eq('Peep 1')
    expect(peeps.first.id).to eq(1)
  end

  it 'finds one peep' do
    repo = PeepRepository.new

    peep = repo.find(2)
    
    expect(peep.id).to eq(2)
    expect(peep.title).to eq('Peep 2')
    expect(peep.content).to eq('This is my second Peep')
  end

  it 'creates a Peep' do
    repo = PeepRepository.new

    new_peep = Peep.new
    new_peep.title = 'Peep 6'
    new_peep.content = 'This is my sixth Peep'
    repo.create(new_peep)

    peeps = repo.all

    expect(peeps.length).to eq(6)
    expect(peeps.last.title).to eq('Peep 6')
    expect(peeps.last.id).to eq(6)
  end

  it 'deletes a peep' do
    repo = PeepRepository.new

    repo.delete(1)
    peeps = repo.all

    expect(peeps.length).to eq(4)
    expect(peeps.first.id).to eq(2)
  end

  
end