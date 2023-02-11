require 'peep'
require 'peeprepository'
require 'database_connection'

def reset_table
  seed_sql = File.read('spec/seeds/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe PeepRepository do
  before(:each) do 
    reset_table
  end

  it "displays all peeps" do
    new_peep = Peep.new
    repo = PeepRepository.new
    all_peeps = repo.all
    expect(all_peeps.length).to eq 4
    expect(all_peeps.first.id).to eq '3'
    expect(all_peeps[2].content).to eq 'Hello, I am Harry'
  end

  it "creates new peep" do
    new_peep = Peep.new
    repo = PeepRepository.new
    new_peep.content = "This is a new peep"
    new_peep.time = "2020-06-22 19:10:25"
    new_peep.user_id = '2'
    repo.create(new_peep)
    
    all_peeps = repo.all

    expect(all_peeps.length).to eq(5)
    expect(all_peeps[3].content).to eq "This is a new peep"
  end
end
