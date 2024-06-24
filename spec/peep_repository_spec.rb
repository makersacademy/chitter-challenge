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

  let(:repo) { PeepRespository.new }
  let(:message) { "Hello, world!" }
  let(:timestamp) { "2099-10-10 10:10:10" }
  let(:author_id) { author_id = 2 }

  it "Returns all peeps in reverse chronological order with their author's name and tag" do
    all_peeps = repo.all_with_author
    expect(all_peeps.length).to eq 3
    expect(all_peeps.first.message).to eq "Big Brother is watching you @wsmith"
    expect(all_peeps.last.message).to eq "We shall meet in the place where there is no darkness"
    expect(all_peeps.last.posted_at).to eq "1984-06-15 14:33:00"
    expect(all_peeps[1].user.name).to eq "Tom Carmichael-Mhanna"
    expect(all_peeps[1].user.username).to eq "tcarmichael"
  end

  it "Creates a new peep" do
    repo.create(message, timestamp, author_id)
    all_peeps = repo.all_with_author
    expect(all_peeps.length).to eq 4
    expect(all_peeps.last.message).to eq "We shall meet in the place where there is no darkness"
    expect(all_peeps.first.message).to eq "Hello, world!"
    expect(all_peeps.first.posted_at).to eq "2099-10-10 10:10:10"
    expect(all_peeps.first.user.name).to eq "Sarwah Mhanna"
    expect(all_peeps.first.user.username).to eq "smhanna"
  end

  it "returns the ID of the most recent peep" do
    expect(repo.most_recent_peep_id).to eq 2
    repo.create(message, timestamp, author_id)
    expect(repo.most_recent_peep_id).to eq 4
  end

end
