require 'peep_repository'

def reset_tables
  sql = File.read("spec/seed.sql")
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(sql)
end

RSpec.describe PeepRepository do
  before(:each) do
    reset_tables
  end
  it "gets all peep objects" do
    repo = PeepRepository.new
    peeps = repo.all
    expect(peeps[0].id).to eq 1
    expect(peeps[0].content).to eq "some text"
    expect(peeps[0].date).to eq "1999-01-08 04:05:06"
    expect(peeps[0].user_id).to eq 1

    expect(peeps[1].id).to eq 2
    expect(peeps[1].content).to eq "some more text"
    expect(peeps[1].date).to eq "1999-01-08 04:05:06"
    expect(peeps[1].user_id).to eq 1
  end
  it "gets peep object by id" do
    repo = PeepRepository.new
    peep = repo.find(1)
    expect(peep[0].id).to eq 1
    expect(peep[0].content).to eq "some text"
    expect(peep[0].date).to eq "1999-01-08 04:05:06"
    expect(peep[0].user_id).to eq 1
  end
  it "gets creates a peep record" do
    repo = PeepRepository.new
    peep = Peep.new

    peep.content = "test text"
    peep.date = "2021-02-08 04:05:15"
    peep.user_id = 1
    repo.create(peep)
    peeps = repo.all
    expect(peeps[2].id).to eq 3
    expect(peeps[2].content).to eq "test text"
    expect(peeps[2].date).to eq "2021-02-08 04:05:15"
    expect(peeps[2].user_id).to eq 1
  end

  it "deletes a peep record from database" do
    repo = PeepRepository.new
    repo.delete(1)
    peeps = repo.all

    expect(peeps.length).to eq 1
    expect(peeps[0].id).to eq 2
    expect(peeps[0].content).to eq "some more text"
    expect(peeps[0].date).to eq "1999-01-08 04:05:06"
    expect(peeps[0].user_id).to eq 1
  end

  it "finds all user tweeps" do
    repo = PeepRepository.new
    
    peeps = repo.find_by_user(1)

    expect(peeps.length).to eq 2
    expect(peeps[0].id).to eq 1
    expect(peeps[0].content).to eq "some text"
    expect(peeps[0].date).to eq "1999-01-08 04:05:06"
    expect(peeps[0].user_id).to eq 1
  end
end
