require "peep"
require "peep_repository" 

def reset_user_table
  seed_sql = File.read('spec/users-peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end 

RSpec.describe PeepRepository do 
  before(:each) do 
    reset_user_table
  end 

  it "returns all peeps" do 
    repo = PeepRepository.new 
    peep = repo.all 

    expect(peep.length).to eq 4
    expect(peep[0].message).to eq 'COMING HOME!'
    expect(peep[0].time).to eq '2022-12-01 10:00:00'
    expect(peep[0].user_id).to eq 1
  end

  it "creates a new peep" do 
    repo = PeepRepository.new 
    new_peep = Peep.new 
    new_peep.message = 'Rashford needs to start!'
    new_peep.time = '2022-12-01 17:36:00'
    new_peep.user_id = 3

    repo.create(new_peep)
    all_peeps = repo.all

    expect(all_peeps.length).to eq 5
    expect(all_peeps[4].message).to eq 'Rashford needs to start!'
    expect(all_peeps[4].time).to eq '2022-12-01 17:36:00'
    expect(all_peeps[4].user_id).to eq 3
  end 
end 