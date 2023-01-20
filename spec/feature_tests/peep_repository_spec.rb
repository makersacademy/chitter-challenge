require 'peep'
require 'peep_repository'
require 'date'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/peep_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
  connection.exec(seed_sql)
end
  
describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  it "returns all peeps" do 
    peep_repo = PeepRepository.new
    all_peeps = peep_repo.all
    expect(all_peeps.length).to eq 6
  end 

  it "creates a new peep and stores it in the peep table" do
    peep_repo = PeepRepository.new
    new_peep = Peep.new

    new_peep.content = 'this is some content'
    new_peep.time_created = Time.now
    new_peep.user_id = '1'
   
    peep_repo.create(new_peep)

    all_peeps = peep_repo.all
    expect(all_peeps.length).to eq 7
  end 
end
