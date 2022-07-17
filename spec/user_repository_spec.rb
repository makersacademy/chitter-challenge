require "user_repository"

def reset_tables
  seed_sql = File.read("schemas/chitter_test.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_tables
  end

  it "returns all users" do
    repo = UserRepository.new
    users = repo.all

    expect(users.length).to eq 4
    expect(users.first.first_name).to eq "Sara"
    expect(users.first.last_name).to eq "Smith"
    expect(users.first.username).to eq "SaraSmith1"
    expect(users.first.email).to eq "test@example.com"
    expect(users.last.email).to eq "test4@example.com"
    expect(users.last.username).to eq "Bethxx"
    expect(users.last.first_name).to eq "Bethany"
    expect(users.last.last_name).to eq "Roy"
  end
end
