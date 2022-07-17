require "peep_repository"

def reset_tables
  seed_sql = File.read("schemas/chitter_test.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do
    reset_tables
  end

  it "returns all peeps" do
    repo = PeepRepository.new
    peeps = repo.all

    expect(peeps.length).to eq 5
    expect(peeps.first.peep_id.length).to eq 36
    expect(peeps.last.user_id.length).to eq 36
    expect(peeps.first.content).to eq "my first peep!!"
    expect(peeps.first.created).to include Time.now.strftime("%F")
    expect(peeps.first.updated).to include Time.now.strftime("%F")
    expect(peeps.last.content).to eq "chitter reminds me of something..."
    expect(peeps.last.created).to include Time.now.strftime("%F")
    expect(peeps.last.updated).to include Time.now.strftime("%F")
    expect(peeps.last.peep_id.length).to eq 36
    expect(peeps.last.user_id.length).to eq 36
  end

  it "returns peeps by username" do
    repo = PeepRepository.new
    peeps = repo.find_by_username("Bethxx")

    expect(peeps.length).to eq 2
    expect(peeps.first.content).to eq "love to peep"
    expect(peeps.first.created).to include Time.now.strftime("%F")
    expect(peeps.first.updated).to include Time.now.strftime("%F")
    expect(peeps.last.content).to eq "chitter reminds me of something..."
    expect(peeps.last.created).to include Time.now.strftime("%F")
    expect(peeps.last.updated).to include Time.now.strftime("%F")
  end

  it "returns peep by username" do
    repo = PeepRepository.new
    peep = repo.find_by_username("SaraSmith1")

    expect(peep.content).to eq "my first peep!!"
  end
end
