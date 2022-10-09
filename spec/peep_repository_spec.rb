require_relative '../lib/peep_repository'

def reset_name_table
  peeps_seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  makers_seed_sql = File.read('spec/seeds/makers_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(peeps_seed_sql)
  connection.exec(makers_seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_name_table
  end

  it "returns all peeps" do
    repo = PeepRepository.new

    expect(repo.all.length).to eq 2
    expect(repo.all.first.id).to eq '1'
  end

  it "creates a new peep" do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.content = 'Woof woof!'
    new_peep.maker_id = '2'

    repo.create(new_peep)
    
    expect(repo.all.length).to eq 3
    expect(repo.all[2].content).to eq 'Woof woof!'
  end
end
