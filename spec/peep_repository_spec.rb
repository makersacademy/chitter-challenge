require "peep"
require "peep_repository"

describe PeepRepository do
  def reset_tables
    seed_sql = File.read("spec/seeds/chitter_seeds.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  it "finds all peeps" do
    repo = PeepRepository.new

    peeps = repo.all

    expect(peeps.length).to eq(5)
    expect(peeps.first.content).to eq("I had a great day at the office!")
    expect(peeps.last.content).to eq("Had a great dinner with my parents.")
  end

  it "creates a new peep" do
    repo = PeepRepository.new

    peep = Peep.new
    peep.content = "I bought the bank!"
    peep.time_posted = "2022-11-13 12:00:00"
    peep.user_id = 1
    repo.create(peep)

    peeps = repo.all

    expect(peeps.last.id).to eq(6)
    expect(peeps.last.content).to eq("I bought the bank!")
    expect(peeps.last.time_posted).to eq("2022-11-13 12:00:00")
    expect(peeps.last.user_id).to eq(1)
  end
end
