require "peep"
require "peep_repository"

def reset_peeps_table
  seed_sql = File.read("spec/seeds/peeps_seeds.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) { reset_peeps_table }

  it "finds all peeps" do
    repo = PeepRepository.new

    peeps = repo.all
    expect(peeps.length).to eq(3)
    expect(peeps.first.message).to eq("I pick my friends like I pick fruit")
    expect(peeps.first.time).to eq("2023-01-08 04:05:06")
    expect(peeps.first.user_id).to eq("1")
  end

  it "finds one peep" do
    repo = PeepRepository.new

    peep = repo.find(3)
    expect(peep.message).to eq("Sometimes I dont wanna feel those metal clouds")
    expect(peep.time).to eq("2023-01-18 08:05:06")
    expect(peep.user_id).to eq("3")
  end

  it "creates a new peep" do
    repo = PeepRepository.new

    new_peep = Peep.new
    new_peep.message = "Woman to woman, I just wanna see you glow"
    new_peep.time = "2023-03-18 19:05:06"
    new_peep.user_id = "4"
    repo.create(new_peep)

    peeps = repo.all

    expect(peeps.length).to eq(4)
    expect(peeps.last.message).to eq(
      "Woman to woman, I just wanna see you glow",
    )
    expect(peeps.last.time).to eq("2023-03-18 19:05:06")
    expect(peeps.last.user_id).to eq("4")
  end

  it "deletes a peep" do
    repo = PeepRepository.new

    repo.delete(1)
    peeps = repo.all

    expect(peeps.length).to eq(2)
    expect(peeps.first.id).to eq(2)
  end
end
