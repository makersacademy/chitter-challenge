require 'user_repository'


def reset_tables
  sql = File.read("spec/seed.sql")
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(sql)
end

RSpec.describe UserRepository do
  before(:each) do
    reset_tables
  end
  it "gets all user objects" do
    repo = UserRepository.new
    users = repo.all

    expect(users.length).to eq 2
    expect(users[0].id).to eq 1
    expect(users[0].username).to eq "pmonson1"
    expect(users[0].email).to eq "parismonson@yahoo.com"
    expect(users[0].password).to eq "hash_password"

    expect(users.length).to eq 2
    expect(users[1].id).to eq 2
    expect(users[1].username).to eq "tessa34"
    expect(users[1].email).to eq "tessa34@yahoo.com"
    expect(users[1].password).to eq "hash_password"
  end
  it "gets user object by id" do
    repo = UserRepository.new
    user = repo.find(2)
    expect(user[0].id).to eq 2
    expect(user[0].username).to eq "tessa34"
    expect(user[0].email).to eq "tessa34@yahoo.com"
    expect(user[0].password).to eq "hash_password"
  end
  it "gets creates a user record" do
    repo = UserRepository.new
    user = User.new

    user.username = "test_name"
    user.email = "test_name@gmail.com"
    user.password = "hash_password"
    repo.create(user)
    users = repo.all
    
    expect(users.length).to eq 3
    expect(users[2].username).to eq "test_name"
    expect(users[2].email).to eq "test_name@gmail.com"
    expect(users[2].password).to eq "hash_password"
  end
  it "deletes a user record from database" do
    repo = UserRepository.new
    repo.delete(1)
    users = repo.all

    expect(users.length).to eq 1
    expect(users[0].id).to eq 2
    expect(users[0].username).to eq "tessa34"
    expect(users[0].email).to eq "tessa34@yahoo.com"
  end
  context "username is in use but email is not" do
    it "checks if username or password is in use" do
      repo = UserRepository.new
      dbl = repo.find_dbl("tessa34", "wrongemail@yahoo.com")
      expect(dbl).to eq true
    end
  end

  context "both are not in use" do
    it "checks if username or password is in use" do
      repo = UserRepository.new
      dbl = repo.find_dbl("tessa3s", "wrongemail@yahoo.com")
      expect(dbl).to eq false
    end
  end
  it "checks if login details are on record" do
    repo = UserRepository.new
    result = repo.check_login("parismonson@yahoo.com", "hash_password")
    expect(result.length).to eq 1
  end

end