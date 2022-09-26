require 'user_repository'
require 'user'

def reset_users_table
  seed_sql = File.read('spec/seeds/chitter_test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end
describe UserRepository do

  before(:each) do 
    reset_users_table
  end

  let(:repo) { UserRepository.new }

  it 'return all user' do
    users = repo.all

    expect(users.length).to eq 3
    expect(users.first.email).to eq 'chris@test.com'
    expect(users.first.username).to eq 'chris97'
    expect(users.first.password).to eq 'zxcvb_123'
    expect(users.first.name).to eq 'Christopher'
  end

  it 'creates a new user' do 
    user = User.new
    user.email = 'test@test.com'
    user.username = 'test'
    user.password = 'test123'
    user.name = 'Test'
    repo.create(user) 

    expect(repo.all.length).to eq 4
    last_user = repo.find(4)

    expect(last_user.email).to eq 'test@test.com'
    expect(last_user.username).to eq 'test'
    expect(last_user.password).to eq 'test123'
    expect(last_user.name).to eq 'Test'
  end

  it 'finds a user by email' do
    user = repo.find_by_email('emma@test.com')
    expect(user.email).to eq 'emma@test.com' 
    expect(user.username).to eq 'emma08'
    expect(user.password).to eq 'asdfg@456'
    expect(user.name).to eq 'Emma'
  end

  it 'finds a user by id' do
    user = repo.find(1)
    expect(user.email).to eq 'chris@test.com'
    expect(user.username).to eq 'chris97'
    expect(user.password).to eq 'zxcvb_123'
    expect(user.name).to eq 'Christopher'
  end
end
