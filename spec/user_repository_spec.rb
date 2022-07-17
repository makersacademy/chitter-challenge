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
    expect(users.first).to include "Sara"
    expect(users.first).to include "Smith"
    expect(users.first).to include "SaraSmith1"
    expect(users.first).to include "test@example.com"
    expect(users.last).to include "test4@example.com"
    expect(users.last).to include "Bethxx"
    expect(users.last).to include "Bethany"
    expect(users.last).to include "Roy"
  end
end
