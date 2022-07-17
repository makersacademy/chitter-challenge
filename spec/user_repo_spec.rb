require 'user'
require 'user_repo'
require 'database_connection'

def reset_user_table
  sql_seed = File.read('spec/seeds/seeds_chitter_db.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
  connection.exec_params(sql_seed)
end

describe UserRepo do
  before(:each) do
    reset_user_table
  end
  
  it "find all users in table" do
    repo = UserRepo.new
    users = repo.all
    expect(users.length).to eq(2)
    expect(users[0].username).to eq("Joe")
    expect(users[0].password).to eq("123")
    
  end

  it "creates a new user" do
    repo = UserRepo.new
    new_user = User.new
    new_user.username = "Colin"
    new_user.password = "emmerdale"
    repo.create_user(new_user)
    users = repo.all
    expect(users.length).to eq(3)
    expect(users[2].username).to eq("Colin")
    expect(users[2].password).to eq("emmerdale")
  end

  it "find method returns user ID by username" do
    repo = UserRepo.new
    to_find = 'Joseph'
    found_id = repo.find(to_find)
    expect(found_id).to eq(2)
  end

  it "match_users? returns false if username does not match any existing" do
    repo = UserRepo.new
    new_user = User.new
    new_user.username = "Colin"
    new_user.password = "1234"
    expect(repo.match_username?(new_user.username)).to eq(false)
  end

  it "match_users? returns true if username does  match any existing" do
    repo = UserRepo.new
    new_user = User.new
    new_user.username = "Joseph"
    expect(repo.match_username?(new_user.username)).to eq(true)
  end

  it "compares entered password to existing passwords- succesful match" do
    repo = UserRepo.new
    new_user = User.new
    new_user.username = "Joe"
    new_user.password = "123"
    expect(repo.invalid_login?(new_user.username, new_user.password)).to eq(false)
  end

  it "compares entered password to existing passwords- failed match- wrong password" do
    repo = UserRepo.new
    new_user = User.new
    new_user.username = "Joe"
    new_user.password = "Hello"
    expect(repo.invalid_login?(new_user.username, new_user.password)).to eq(true)
  end

  it "compares entered password to existing passwords- failed match no username exists" do
    repo = UserRepo.new
    new_user = User.new
    new_user.username = "Nick"
    new_user.password = "123"
    expect(repo.invalid_login?(new_user.username, new_user.password)).to eq(true)
  end
end
