require 'user_repository'
require 'user'


def reset_chitter_table
  seed_sql = File.read('spec/seeds/seeds_chitter_test.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_chitter_table
  end

  it "Returns a list of all users" do
    repository = UserRepository.new

    users = repository.all

    expect(users.length).to eq 2

    expect(users[0].id).to eq 1
    expect(users[0].name).to eq 'Sophie'
    expect(users[0].email_address).to eq 'sl@aol.com'
    expect(users[0].password).to eq 'abc123'
    expect(users[0].username).to eq 'SL'

    expect(users[1].id).to eq 2
    expect(users[1].name).to eq 'Mabon'
    expect(users[1].email_address).to eq 'mg@aol.com'
    expect(users[1].password).to eq 'def456'
    expect(users[1].username).to eq 'MG'
  end

  it "Signing up to create a new user account" do
    repository = UserRepository.new
    user = User.new
    user.name = "Twm"
    user.email_address = "twm@aol.com"
    user.password = "twm123"
    user.username = "TwmJam"

    repository.sign_up(user)

    users = repository.all

    expect(users.length).to eq 3
    expect(users.last.name).to eq "Twm"
    expect(users.last.username).to eq "TwmJam"
  end

  context "finds account details by email" do
    it "successful at finding account" do
      repository = UserRepository.new

      user = repository.find_by_email('sl@aol.com')
      expect(user.length).to eq 1
      expect(user[0].id).to eq 1
      expect(user[0].name).to eq 'Sophie'
    end

    it "unsuccessful at finding account" do
      repository = UserRepository.new

      user = repository.find_by_email('hgfghd')
      expect(user).to eq nil
    end
  end

  context "signing in to an account" do
    it "successfully logs in" do
      repository = UserRepository.new
      user = User.new
      user.name = 'Tigi'
      user.password = 'meow'
      user.username = 'Tigs'
      user.email_address = 'tigi@aol.com'
      repository.sign_up(user)
      account = repository.sign_in('tigi@aol.com', 'meow')

      expect(account).to eq "Login successful"
    end
  end
end