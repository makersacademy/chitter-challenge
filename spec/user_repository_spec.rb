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

  it "lists all users" do
    repo = UserRepository.new
    users = repo.all

    expect(users.length).to eq 2
    expect(users.first.name).to eq "Bob"
    expect(users.first.username).to eq "BigBob"
    expect(users.last.email).to eq "jayjay@makers.com"
    expect(users.last.password).to eq "mypass"
  end

  it "finds user by id" do
    repo = UserRepository.new
    user = repo.find(2)

    expect(user.id).to eq 2
    expect(user.name).to eq "Jay"
    expect(user.username).to eq "HugeJay"
  end

  it "creates a new user and adds it to database" do
    repo = UserRepository.new
    user = User.new
    user.name = "Meddy"
    user.username = "MassiveMeds"
    user.email = "meddy@makers.com"
    user.password = "medmed"

    repo.create(user)

    expect(repo.all.length).to eq 3
    expect(repo.all.last.id).to eq 3
    expect(repo.all.last.name).to eq "Meddy"
  end

  it "finds user by email" do
    repo = UserRepository.new
    user = repo.find_by_email("jayjay@makers.com")

    expect(user.id).to eq 2
    expect(user.password).to eq "mypass"
  end
end
