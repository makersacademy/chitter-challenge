require_relative "../lib/peep.rb"
require_relative "../lib/peep_repository.rb"
require "rspec"

def reset_chitter
  seed_sql = File.read("spec/seeds/seeds_chitter.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do
    reset_chitter
  end

  it "finds all peeps" do
    repo = PeepRepository.new
    peeps = repo.all
    expect(peeps.length).to eq(5)
    expect(peeps.last.content).to eq("Hey peep I can help you! ")
    expect(peeps.last.user_id).to eq("4")
    expect(peeps.last.created).to eq("2022-01-12 02:30:04")
  end

  it "creates a peep and then shows that peep as being top of chitter" do
    repo = PeepRepository.new
    new_peep = Peep.new
    new_peep.id = 6
    new_peep.content = "Looking for a Christmas market in London"
    new_peep.created = "2022-10-12 18:07"
    new_peep.user_id = 2
    repo.create(new_peep)
    peeps = repo.all
    expect(peeps.length).to eq(6)
    expect(peeps.first.content).to eq("This is my first peep")
    expect(peeps.first.user_id).to eq("1")
  end

  it "returns a specific peep with ID 1" do
    repo = PeepRepository.new
    list_peeps = repo.find(1)
    expect(list_peeps.content).to eq "This is my first peep"
    expect(list_peeps.created).to eq "2022-01-12 02:03:04"
    expect(list_peeps.id).to eq "1"
  end
end
