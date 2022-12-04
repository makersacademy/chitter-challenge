require 'user_repository'
require 'user'

def reset_users_table
  seed_sql = File.read('seeds/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  # 1
  it "Get all users" do
    repo = UserRepository.new

    users = repo.all

    expect(users.length).to eq 2

    expect(users[0].id).to eq 1
    expect(users[0].name).to eq 'David'
    expect(users[0].username).to eq 'username1'

    expect(users[1].id).to eq 2
    expect(users[1].name).to eq 'Anna'
    expect(users[1].email).to eq 'user.2@hotmail.com'
    expect(users[1].password).to eq 'password2'
  end

  # 2
  it "Get a single user" do
    repo = UserRepository.new

    user = repo.find(1)

    expect(user.id).to eq 1
    expect(user.name).to eq 'David'
    expect(user.username).to eq 'username1'
    expect(user.email).to eq 'user.1@hotmail.com'
    expect(user.password).to eq 'password1'
  end
  # 3
  it "Get a single user by username" do
    repo = UserRepository.new

    user = repo.find_by_username('username2')

    expect(user.id).to eq 2
    expect(user.name).to eq 'Anna'
    expect(user.username).to eq 'username2'
  end

  # 4
  it "Get a single user by name" do
    repo = UserRepository.new

    user = repo.find_by_name('Anna')

    expect(user.id).to eq 2
    expect(user.username).to eq 'username2'
  end

  # 5
  it "Create a new user" do
    new_user = User.new

    new_user.name = 'Liv'
    new_user.username = 'username3'
    new_user.email = 'user.3@hotmail.com'
    new_user.password = 'password3'

    repo = UserRepository.new

    repo.create(new_user)

    users = repo.all

    expect(users.length).to eq 3
    expect(users[2].name).to eq 'Liv'
  end
end
