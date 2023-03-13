require 'peep'
require 'peep_repository'

describe PeepRepository do

  def reset_peeps_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_peeps_table
  end

  after(:all) do
    reset_peeps_table
  end

  it 'gets all peeps' do

    repo = PeepRepository.new

    peeps = repo.all

    expect(peeps.length).to eq  2

    expect(peeps[0].id).to eq  1
    expect(peeps[0].timestamp).to eq  '2023-03-13 04:50:51'
    expect(peeps[0].content).to eq 'Are birds weather?'
    expect(peeps[0].maker_id).to eq 1

    expect(peeps[1].id).to eq  2
    expect(peeps[1].timestamp).to eq  '2023-03-13 04:52:59'
    expect(peeps[1].content).to eq 'How much string is there in the world?'
    expect(peeps[1].maker_id).to eq 2

  end

  it 'creates a new peep' do
    repo = PeepRepository.new

    peep = Peep.new
    peep.timestamp = '2023-03-13 06:22:10'
    peep.content = 'My bucket of water is upside down.'
    peep.maker_id = 1
    repo.create(peep)
    
    peeps = repo.all
    
    expect(peeps.last.id).to eq 3
    expect(peeps.last.timestamp).to eq '2023-03-13 06:22:10'
    expect(peeps.last.content).to eq 'My bucket of water is upside down.'
    expect(peeps.last.maker_id).to eq 1
  end
end