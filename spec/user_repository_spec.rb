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

  it "Creates a new user account" do
    repository = UserRepository.new
    user = User.new
    user.name = "Twm"
    user.email_address = "twm@aol.com"
    user.password = "twm123"
    user.username = "TwmJam"

    repository.create(user)

    users = repository.all

    expect(users.length).to eq 3
    expect(users.last.name).to eq "Twm"
    expect(users.last.username).to eq "TwmJam"
    end
end