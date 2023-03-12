require 'peep_repository'
require 'peep'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_db_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do
    reset_peeps_table
  end

  it 'shows all peeps' do
    repo = PeepRepository.new
    peeps = repo.all
    expect(peeps.length).to eq(3)
    
    expect(peeps[0].id).to eq(1)
    expect(peeps[0].content).to eq('Content1')
    expect(peeps[0].time).to eq('2023-02-14 10:27:15')
    expect(peeps[0].maker_id).to eq(1)
    
    expect(peeps[1].id).to eq(2)
    expect(peeps[1].content).to eq('Content2')
    expect(peeps[1].time).to eq('2023-02-14 11:27:15')
    expect(peeps[1].maker_id).to eq(2)

    expect(peeps[2].id).to eq(3)
    expect(peeps[2].content).to eq('Content3')
    expect(peeps[2].time).to eq('2023-02-15 12:27:15')
    expect(peeps[2].maker_id).to eq(1)
  end
end

