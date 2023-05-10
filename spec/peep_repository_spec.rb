require 'peep_repository'
require 'peep'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_site_test' })
  connection.exec(seed_sql)
end

RSpec.describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  it 'returns an array of all peeps' do
    repo = PeepRepository.new
    peeps = repo.all

    expect(peeps.length).to eq 2

    expect(peeps[0].id).to eq 1
    expect(peeps[0].content).to eq 'First post'
    expect(peeps[0].time).to eq '12:00:00'
    expect(peeps[0].user_id).to eq 1
    
    expect(peeps[1].id).to eq 2
    expect(peeps[1].content).to eq 'Second post'
    expect(peeps[1].time).to eq '13:00:00'
    expect(peeps[1].user_id).to eq 1
  end

  it 'finds a single peep' do
    repo = PeepRepository.new

    peep = repo.find(1)
    
    expect(peep.id).to eq 1
    expect(peep.content).to eq 'First post'
    expect(peep.time).to eq '12:00:00'
    expect(peep.user_id).to eq 1
  end

  it 'adds a new peep to the database' do
    repo = PeepRepository.new
    peep = Peep.new
    peep.content = 'New post'
    peep.time = '15:00'
    peep.user_id = 1

    repo.create(peep)
    
    new_peep = repo.all.last
    
    expect(new_peep.id).to eq 3
    expect(new_peep.content).to eq 'New post'
    expect(new_peep.time).to eq '15:00:00'
    expect(new_peep.user_id).to eq 1
  end

  it "finds all peeps with user's details" do
    repo = PeepRepository.new
    peeps = repo.all_with_users

    expect(peeps.length).to eq 2
    expect(peeps[0].id).to eq 1
    expect(peeps[0].content).to eq 'First post'
    expect(peeps[0].time).to eq '12:00:00'
    expect(peeps[0].user_id).to eq 1

    expect(peeps[0].name).to eq 'Louis'
    expect(peeps[0].username).to eq 'lpc'
    expect(peeps[1].name).to eq 'Louis'
    expect(peeps[1].username).to eq 'lpc'
  end
end
