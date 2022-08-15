require 'peep'
require 'peep_repository'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter-challenge' })
  connection.exec(seed_sql)
end
  
describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  it 'returns all peeps' do
    repo = PeepRepository.new
    peeps = repo.all
    expect(peeps.length).to eq(5)
    
  end
  
end
  
