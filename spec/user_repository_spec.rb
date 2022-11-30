require 'user_repository'
require 'user'

RSpec.describe UserRepository do 

  def reset_users_table
    seed_sql = File.read('spec/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_users_table
  end

  it 'prints a list of all users' do
    
    repo = UserRepository.new

    users = repo.all
    
    expect(users.length).to eq(2) 
    expect(users.first.id).to eq('1') 
    expect(users.first.name).to eq('user1')
    expect(users.first.username).to eq('username1')
    expect(users.first.email).to eq('user1@fakeemail.com') 
    expect(users.first.password).to eq('fakepassword1') 
  end

  it 'gets a single user by id' do
    repo = UserRepository.new

    user = repo.find(1)

    expect(user.id).to eq("1") 
    expect(user.name).to eq('user1') 
    expect(user.username).to eq('username1') 
    expect(user.email).to eq('user1@fakeemail.com')
    expect(user.password).to eq('fakepassword1') 
  end

  it 'gets another single user by id' do
    repo = UserRepository.new

    user = repo.find(2)

    expect(user.id).to eq("2") 
    expect(user.name).to eq('user2') 
    expect(user.username).to eq('username2') 
    expect(user.email).to eq('user2@fakeemail.com')
    expect(user.password).to eq('fakepassword2') 
  end

  it 'gets a single user by username' do
    repo = UserRepository.new

    user = repo.find_by_username("username2")

    expect(user.id).to eq("2") 
    expect(user.name).to eq('user2') 
    expect(user.username).to eq('username2') 
    expect(user.email).to eq('user2@fakeemail.com')
    expect(user.password).to eq('fakepassword2') 
  end

  it 'creates a new user' do
    repo = UserRepository.new

    user = User.new
    user.name = 'user3'
    user.username = 'username3'
    user.email = 'user3@fakeemail.com'
    user.password = 'fakepassword3'

    repo.create(user)

    users = repo.all

    expect(users.length).to eq(3) # => 3

    last_user = users.last
    expect(last_user.name).to eq('user3') 
    expect(last_user.username).to eq('username3') 
    expect(last_user.email).to eq('user3@fakeemail.com')
    expect(last_user.password).to eq('fakepassword3') 
  end
end