require "user"
require "user_repository"

def reset_tables
  seed_sql = File.read("spec/seeds/chitter_seeds.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_tables
  end

  it "creates a new user" do
    repo = UserRepository.new

    user = User.new
    user.name = "Barry Allen"
    user.username = "speedster4"
    user.password = "zxc"
    user.email = "barry4@jlmail.com"
    repo.create(user)

    new_user = repo.find(4)

    expect(new_user.id).to eq(4)
    expect(new_user.name).to eq("Barry Allen")
    expect(new_user.username).to eq("speedster4")
    expect(new_user.email).to eq("barry4@jlmail.com")
  end

  it "finds 1 user" do
    repo = UserRepository.new

    user = repo.find(2)

    expect(user.id).to eq(2)
    expect(user.name).to eq("Clark Kent")
    expect(user.username).to eq("farmboy2")
    expect(user.email).to eq("clark2@jlmail.com")
  end

  it "finds a user by email" do
    repo = UserRepository.new

    user = repo.find_by_email("clark2@jlmail.com")
    expect(user.id).to eq(2)
    expect(user.name).to eq("Clark Kent")
    expect(user.username).to eq("farmboy2")
    expect(user.email).to eq("clark2@jlmail.com")
  end

  it "finds a user by username" do
    repo = UserRepository.new

    user = repo.find_by_username("farmboy2")
    expect(user.id).to eq(2)
    expect(user.name).to eq("Clark Kent")
    expect(user.username).to eq("farmboy2")
    expect(user.email).to eq("clark2@jlmail.com")
  end

  it "returns nil when email not found" do
    repo = UserRepository.new

    user = repo.find_by_email("clark2@jlmail.cm")
    expect(user).to eq(nil)
  end

  it "returns nil when username not found" do
    repo = UserRepository.new

    user = repo.find_by_username("garmboy2")
    expect(user).to eq(nil)
  end
end
