require 'peep'
require 'peep_repository'

describe PeepRepository do
  def reset_peeps_table
    seed_sql = File.read('spec/seeds/chitter_test_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end  

  before(:each) do 
    reset_peeps_table
  end

  let(:repo) { PeepRepository.new }

  it 'returns all peeps' do
    peeps = repo.all

    expect(peeps.length).to eq 4
    expect(peeps.first.content).to eq 'content1'
    expect(peeps.first.post_time).to eq '2022-05-10 10:50:55'
    expect(peeps.first.user_id).to eq 2
  end

  it 'creates a new peep' do
    peep = Peep.new
    peep.content = 'content5'
    peep.post_time = '2022-09-20 11:45:00'
    peep.user_id = 1
    repo.create(peep)

    expect(repo.all.length).to eq 5
    last_peep = repo.find(5)

    expect(last_peep.id).to eq 5
    expect(last_peep.user_id).to eq 1
    expect(last_peep.content).to eq 'content5'
    expect(last_peep.post_time).to eq '2022-09-20 11:45:00'
  end 

  it 'finds peep by id' do
    peep = repo.find(1)
    expect(peep.user_id).to eq 2
    expect(peep.content).to eq 'content1'
    expect(peep.post_time).to eq '2022-05-10 10:50:55'
  end
end
