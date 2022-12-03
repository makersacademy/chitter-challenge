require 'user'
require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  # (your tests will go here).

  it "returns all users" do
    repo = UserRepository.new

    users = repo.all

    expect(users.length).to eq 2

    expect(users[0].id).to eq '1'
    expect(users[0].name).to eq 'David'
    expect(users[0].email_address).to eq 'email_1@yahoo.co.uk'
    expect(users[0].password).to eq '##^%$&^$#'

    expect(users[1].id).to eq '2'
    expect(users[1].name).to eq 'Anna'
    expect(users[1].email_address).to eq 'email_2@gmail.com'
    expect(users[1].password).to eq '#%%&^%££###'
  end

  it "finds user by email" do
    repo = UserRepository.new

    user = repo.find_by_email('email_1@yahoo.co.uk')

    expect(user.id).to eq '1'
    expect(user.name).to eq 'David'
    expect(user.email_address).to eq 'email_1@yahoo.co.uk'
    expect(user.password).to eq '##^%$&^$#'
  end

  it "finds user by id" do
    repo = UserRepository.new

    user = repo.find(1)

    expect(user.id).to eq '1'
    expect(user.name).to eq 'David'
    expect(user.email_address).to eq 'email_1@yahoo.co.uk'
    expect(user.password).to eq '##^%$&^$#'

  end

  it "finds user by name" do
    repo = UserRepository.new

    user = repo.find_by_name('David')

    expect(user.id).to eq '1'
    expect(user.name).to eq 'David'
    expect(user.email_address).to eq 'email_1@yahoo.co.uk'
    expect(user.password).to eq '##^%$&^$#'

  end

  it "creates a new user" do
    repo = UserRepository.new

    user = User.new
    user.name = 'Eric'
    user.email_address = 'new_address@aol.com'
    user.password = 'new password'

    repo.create(user)

    users = repo.all

    expect(users.last.id).to eq '3'
    expect(users.last.name).to eq 'Eric'
    expect(users.last.email_address).to eq 'new_address@aol.com'
    expect(users.last.password).to eq 'new password'
  end
end