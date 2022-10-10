require_relative '../lib/peep'
require_relative '../lib/peep_repository'

def reset_chitter_table
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end
  
describe PeepRepository do
  before(:each) do 
    reset_chitter_table
  end

  it 'returns all peeps' do
    repo = PeepRepository.new

    peeps = repo.all
    
    expect(peeps.length).to eq(4)
    expect(peeps.first.content).to eq('I love games')
  end

  it 'finds a peep' do
    repo = PeepRepository.new

    peep = repo.find(1)
    
    expect(peep.id).to eq(1)
    expect(peep.content).to eq('I love games')
    expect(peep.user_id).to eq(1)
  end

  it 'creates a peep' do
    repo = PeepRepository.new

    peep = Peep.new
    peep.content = 'I love bikes'
    peep.time = '2020-08-12 10:19:20'
    peep.user_id = 3
    
    repo.create(peep)

    peeps = repo.all

    expect(peeps.length).to eq(5)
    expect(peeps.last.content).to eq('I love bikes')
  end
end
