require "user_repository"
require "bcrypt"

def reset_users_table
  seed_sql = File.read('spec/seeds/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  it "returns a list of users" do
    repo = UserRepository.new
    users = repo.all

    expect(users.length).to eq 3
  end

  it "returns the first user" do
    repo = UserRepository.new
    users = repo.all

    expect(users.first.username).to eq "joebloggs123"
    expect(users.first.name).to eq "Joe Bloggs"
    expect(users.first.email).to eq "joebloggs@gmail.com"
    expect(users.first.password).to eq "$2a$12$LO.0xwjovoGUVJTubcCOl.W10MkezxwOTfIS6yKRq8qCRS8iMwHZq"
  end

  it "creates a new user and then checks how many users there are" do
    repo = UserRepository.new

    user = User.new
    user.username = "Sally Brown"
    user.name = "Sally Brown"
    user.email = "sally.brown@gmail.com"
    user.password = "abc123abc123"
    repo.create(user)

    all_users = repo.all
    expect(all_users.length).to eq 4
  end

  it "creates a new user and then checks the last insert" do
    repo = UserRepository.new

    user = User.new
    user.username = "gemmawhite99"
    user.name = "Gemma White"
    user.email = "gemma.white@gmail.com"
    user.password = "xyz987xyz987"
    repo.create(user)

    all_users = repo.all
    expect(all_users.last.username).to eq "gemmawhite99"
    expect(all_users.last.name).to eq "Gemma White"
    expect(all_users.last.email).to eq "gemma.white@gmail.com"
  end
end