require "user_repository"

describe UserRepository do
  def reset_tables
    seed_sql = File.read("spec/seeds/test_seeds.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end
#your tests go here
  it "lists all users" do
    repo = UserRepository.new
    users = repo.all

    expect(users.length).to eq 2
    expect(users.first.name).to eq "user1"
    expect(users.first.username).to eq "username1"
    expect(users.last.email).to eq "user2@email.com"
    expect(users.last.password).to eq "password2"
  end

  it "finds user by id" do
    repo = UserRepository.new
    user = repo.find(2)

    expect(user.id).to eq 2
    expect(user.name).to eq "user2"
    expect(user.username).to eq "username2"
  end

  it "creates a new user and adds it to database" do
    repo = UserRepository.new
    user = User.new
    user.name = "user3"
    user.username = "username3"
    user.email = "user3@email.com"
    user.password = "password3"

    repo.create(user)

    expect(repo.all.length).to eq 3
    expect(repo.all.last.id).to eq 3
    expect(repo.all.last.name).to eq "user3"
  end



end