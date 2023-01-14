require_relative '../lib/user_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_tables
  end

  it "returns all users from the table" do
    repo= UserRepository.new
    users = repo.all

    expect(users[0].id).to eq "1"
    expect(users[0].name).to eq "Adam Hoar"
    expect(users[0].email).to eq "pretend@hotmail.com"
    expect(users[0].user_name).to eq "adam1"
    expect(users[0].password).to eq "password1"
    expect(users[0].logged_in).to eq "f"

    expect(users[1].id).to eq "2"
    expect(users[1].name).to eq "Joe Bloggs"
    expect(users[1].email).to eq "fake@icloud.com"
    expect(users[1].user_name).to eq "joe1"
    expect(users[1].password).to eq "pizza123"
    expect(users[1].logged_in).to eq "f"

    expect(users[2].id).to eq "3"
    expect(users[2].name).to eq "John Doe"
    expect(users[2].email).to eq "real@icloud.com"
    expect(users[2].user_name).to eq "john3"
    expect(users[2].password).to eq "makers1"
    expect(users[2].logged_in).to eq "f"
  end

  it "inserts new user into users table if they do not already exist" do
    repo = UserRepository.new
    expect(repo.sign_up('Fake Name', 'notreal@hotmail.com', 'MD', '123')).to eq true
    users = repo.all

    expect(users[-1].name).to eq 'Fake Name'
    expect(users[-1].email).to eq 'notreal@hotmail.com'
    expect(users[-1].user_name).to eq 'MD'
    expect(users[-1].password).to eq '123'
    expect(users[-1].logged_in).to eq 'f'
  end

  it "does not create new user if email or username exists" do
    repo = UserRepository.new
    expect(repo.sign_up('Fake Name', 'notreal@hotmail.com', 'adam1', '123')).to eq false
  end

  it "changes logged_in from false to true inside db" do
    repo = UserRepository.new
    first_users = repo.all
    expect(repo.log_in('john3', 'makers1')).to eq "You are logged in"
    second_users = repo.all
    expect(second_users[-1].name).to eq "John Doe"
    expect(second_users[-1].logged_in).to eq 't'
  end

  it "returns message for wrong user_name/password" do
    repo = UserRepository.new
    expect(repo.log_in('john3', 'makers')).to eq "Incorrect password or user name"
  end

  it "checks if the user is already logged in" do
    repo = UserRepository.new
    repo.log_in('adam1', 'password1')
    expect(repo.check_logged_in('adam1')).to eq true
  end

  it "returns false if user is not logged in" do
    repo = UserRepository.new
    expect(repo.check_logged_in('adam1')).to eq false
  end

  it "finds user_name based on id" do
    repo = UserRepository.new
    expect(repo.find_user_name(1)).to eq "adam1"
  end
end