require 'user_repository'

def reset_tables
  seed_sql = File.read('spec/spec_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end
describe UserRepository do
  before(:each) do 
    reset_tables
  end
  it "returns all users in table" do
    repo = UserRepository.new
    users = repo.all
    expect(users.size).to eq 4
    expect(users[2].id).to eq "3"
    expect(users[3].username).to eq "Max"
    expect(users[1].password).to eq "Maths!"
  end

  it "creates a new user in the table" do
    repo = UserRepository.new
    user = User.new
    user.username = "Kofi"
    user.password = "brew"
    user.email = "kofi@makers.com"
    repo.create(user)
    all_users = repo.all
    expect(all_users).to include(
      have_attributes(
        username: "Kofi",
        password: "brew",
        email: "kofi@makers.com"
      )
    )
  end

  it "deletes a user" do
    repo = UserRepository.new
    repo.delete(2)
    expect(repo.all.size).to eq 3
    repo.delete(1)
    all_users = repo.all
    expect(all_users.size).to eq 2
    expect(all_users[0].username).to eq "Luke"
  end

  it "finds and returns an individual user in table by ID" do
    repo = UserRepository.new
    found_user = repo.find_by_id(2)
    expect(found_user.id).to eq "2"
    expect(found_user.username).to eq "James"
    expect(found_user.password).to eq "Maths!"
  end

  it "checks login details for a non existent user" do
    repo = UserRepository.new
    login_check = repo.verify("Bob", "password")
    expect(login_check).to eq false
  end

  it "checks login details for an incorrect password" do
    repo = UserRepository.new
    login_check = repo.verify("Edward", "password123")
    expect(login_check).to eq false
  end

  it "checks login details for an existing user" do
    repo = UserRepository.new
    login_check = repo.verify("Edward", "12345")
    expect(login_check).to eq true
  end
end
