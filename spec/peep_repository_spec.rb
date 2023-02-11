require 'peep'
require 'peep_repository'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_chatter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  it 'finds all peeps ' do
    repo = PeepRepository.new
   
    peeps = repo.all
    
    expect(peeps.length).to eq(2)
    expect(peeps.first.title).to eq('Monday Yawning')
    expect(peeps.first.username).to eq('Rubber Duckie')
    expect(peeps.first.content).to include('Is it possible that')
    end
  end

