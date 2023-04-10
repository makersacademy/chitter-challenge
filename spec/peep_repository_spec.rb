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

  it "Returns all peeps in reverse chronological order" do
    repo = PeepRespository.new
    all_peeps =repo.all_by_rev_date_order
    expect(all_peeps.length).to eq 3
    expect(all_peeps.first.message).to eq "Big Brother is watching you @wsmith"
    expect(all_peeps.last.message).to eq "We shall meet in the place where there is no darkness"
    expect(all_peeps.last.posted_at).to eq "1984-06-15 14:33:00"
    expect(all_peeps[1].user_id).to eq 1
  end
end
