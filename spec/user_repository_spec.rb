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

  it "finds a user by email" do
    repo = UserRepository.new
    user = repo.find_by_email("test3@example.com")

    expect(user.first_name).to eq "Troy"
    expect(user.last_name).to eq "Ng"
    expect(user.username).to eq "tAsInTroy"
  end

  context "email does not exist in db" do
    it "fails" do
      repo = UserRepository.new

      expect { repo.find_by_email("test") }.to raise_error "This email does not exist in the database."
    end
  end

  it "creates a new user" do
    repo = UserRepository.new
    repo.create(double(:user, first_name: "Jane", last_name: "Doe", email: "jane@doe.com", username: "Jane1", password: "password"))
    new_user = repo.all.last

    expect(new_user.first_name).to eq "Jane"
    expect(new_user.last_name).to eq "Doe"
    expect(new_user.email).to eq "jane@doe.com"
    expect(new_user.username).to eq "Jane1"
  end
end
