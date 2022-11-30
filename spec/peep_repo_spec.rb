require 'peep_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_test_db.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_tables
  end

  it 'returns all peeps' do 
    repo = PeepRepository.new

    peeps = repo.all

    expect(peeps.length).to eq(5)

    expect(peeps[0].id).to eq('1') 
    expect(peeps[0].content).to eq('My first post')
    expect(peeps[0].user_id).to eq('1') 

    expect(peeps[1].id).to eq('2') 
    expect(peeps[1].content).to eq('I am a transformer')
    expect(peeps[1].user_id).to eq('2') 

    expect(peeps[4].id).to eq('5') 
    expect(peeps[4].content).to eq('My third post') 
    expect(peeps[4].user_id).to eq('1')
  end

  it 'creates peeps' do 
    repo = PeepRepository.new 

    new_peep = Peep.new 
    new_peep.content = 'Newest peep'
    
    repo.create(new_peep)

    expect(repo.all.last.content).to eq('Newest peep')
  end
end