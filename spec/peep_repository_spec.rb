require "peep_repository"

def reset_peeps_table
  seed_sql = File.read('spec/seeds/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end

  it "returns a list of peeps" do
    repo = PeepRepository.new
    peeps = repo.all

    expect(peeps.length).to eq 3
  end

  it "returns the most recent peep" do
    repo = PeepRepository.new
    peeps = repo.all
    expect(peeps.first.id).to eq "3"
    expect(peeps.first.content).to eq "Just a random peep!"
    expect(peeps.first.user_id).to eq "2"
  end

  it "creates a new peep and then checks how many peeps there are" do
    repo = PeepRepository.new

    peep = Peep.new
    peep.content = "This peep was created on behalf of user: chitter_guy'"
    peep.user_id = "3"
    repo.create(peep)

    all_peeps = repo.all
    expect(all_peeps.length).to eq 4
  end

  it "create a new peep and then check the last insert" do 
    repo = PeepRepository.new

    peep = Peep.new
    peep.content = "This peep was created on behalf of user: chitter_guy"
    peep.user_id = "3"
    repo.create(peep)

    all_peeps = repo.all
    expect(all_peeps.first.content).to eq "This peep was created on behalf of user: chitter_guy"
    expect(all_peeps.first.user_id).to eq "3"
  end
end