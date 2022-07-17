require 'peep'
require 'peep_repo'
require 'database_connection'

def reset_peep_table
  sql_seed = File.read('spec/seeds/seeds_chitter_db.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
  connection.exec_params(sql_seed)
end

describe PeepRepo do
  before(:each) do
    reset_peep_table
  end

  it "all returns all peeps" do
    repo = PeepRepo.new
    peeps = repo.all
    expect(peeps.length).to eq(3)
    expect(peeps[0].content).to eq("This is post num 1")
  end

  it "creates a new peep" do
    repo = PeepRepo.new
    new_peep = Peep.new
    new_peep.content = "New post added"
    new_peep.author_id = 2
    new_peep.time_posted = "2022-01-01 12:00:00"
    repo.create_peep(new_peep)
    peeps = repo.all
    expect(peeps.length).to eq(4)
    expect(peeps.last.content).to eq("New post added")
    expect(peeps.last.author_id).to eq(2)
  end

  context "peep_feed#" do
    it " returns author, content and time_posted in reverse chron. order" do
      repo = PeepRepo.new
      peeps = repo.peep_feed
      expect(peeps.length).to eq(3)
      expect(peeps.last.content).to eq("Birthday!")
      expect(peeps.first.author).to eq("Joe")
      expect(peeps.last.time).to eq("2021-05-12 12:00:00")
    end
  end
end
