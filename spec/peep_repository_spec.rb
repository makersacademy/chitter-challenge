require 'peep'
require 'peep_repository'

def reset_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

RSpec.describe PeepRepository do
  before(:each) do 
    reset_table
  end

  it 'gets all peeps' do
    peep_repo= PeepRepository.new

    peeps = peep_repo.all
    expect(peeps.length).to eq 3
    expect(peeps.first.content).to eq 'Good morning everyone!'
    expect(peeps.first.time).to eq '2022-08-10 10:46:45.558437+01'
    expect(peeps.first.user_id).to eq '1'
  end

  it 'creates a peep' do
    allow(Time).to receive(:now).and_return('2022-08-05 11:15:45.558437 +0100')
    new_peep = Peep.new
    new_peep.content = 'FAKE_CONTENT_1'
    new_peep.user_id = '1'    
    
    peep_repo = PeepRepository.new
    peep_repo.create(new_peep)

    peeps = peep_repo.all
    expect(peeps.length).to eq 4
    expect(peeps.last.content).to eq 'FAKE_CONTENT_1'
    expect(peeps.last.time).to eq '2022-08-05 11:15:45.558437+01'
    expect(peeps.last.user_id).to eq '1'
  end
end