require "peep_repository"

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect(host: '127.0.0.1', dbname: 'chitter_test')
  connection.exec(seed_sql)
end

describe PeepRespository do
  before :each do
    reset_tables
  end

  it "Returns all peeps in reverse chronological order with their author's name and tag" do
    repo = PeepRespository.new
    all_peeps = repo.all_with_author
    expect(all_peeps.length).to eq 3
    expect(all_peeps.first.message).to eq "Big Brother is watching you @wsmith"
    expect(all_peeps.last.message).to eq "We shall meet in the place where there is no darkness"
    expect(all_peeps.last.posted_at).to eq "1984-06-15 14:33:00"
    expect(all_peeps[1].user.name).to eq "Tom Carmichael-Mhanna"
    expect(all_peeps[1].user.username).to eq "tcarmichael"
  end

  it "Creates a new peep" do
    repo = PeepRespository.new
    message = "Hello, world!"
    timestamp = "2099-10-10 10:10:10"
    author_id = 2
    repo.create(message, timestamp, author_id)
    all_peeps = repo.all_with_author
    expect(all_peeps.length).to eq 4
    expect(all_peeps.last.message).to eq "We shall meet in the place where there is no darkness"
    expect(all_peeps.first.message).to eq "Hello, world!"
    expect(all_peeps.first.posted_at).to eq "2099-10-10 10:10:10"
    expect(all_peeps.first.user.name).to eq "Sarwah Mhanna"
    expect(all_peeps.first.user.username).to eq "smhanna"
  end
end
