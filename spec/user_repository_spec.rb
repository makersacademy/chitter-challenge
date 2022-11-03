require_relative '../lib/user_repository'
require_relative '../lib/user'

def reset_chitter_table
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_chitter_table
  end

  it 'returns list of users' do
    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq(3)
    expect(users.first.username).to eq('sia')
    expect(users[1].email).to eq('batman@fake.com')
    expect(users[2].password).to eq('shipl0v3r')
  end

  it 'finds user with ID 2' do
    repo = UserRepository.new
    user = repo.find(2)
    expect(user.id).to eq(2)
    expect(user.username).to eq('batman')
    expect(user.email).to eq('batman@fake.com')
    expect(user.password).to eq('justicel0v3r')
  end

  it 'creates a new user' do
    repo = UserRepository.new
    user = User.new
    user.username = 'jasmine'
    user.password = 'awh0len3wW0rld'
    user.email = 'jasmine@fake.com'
    repo.create(user)
    users = repo.all
    expect(users.length).to eq(4)
    expect(users.last.username).to eq('jasmine')
    expect(users.last.password).to eq('awh0len3wW0rld')
    expect(users.last.email).to eq('jasmine@fake.com')
  end
end