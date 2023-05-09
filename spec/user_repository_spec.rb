require_relative '../lib/user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  it 'Returns all (2) users' do
    repo = UserRepository.new

    users = repo.all

    expect(users.length).to eq 2

    expect(users[0].id).to eq '1'
    expect(users[0].email).to eq 'samm@makersacademy.com'
    expect(users[0].password).to eq 'password123'
    expect(users[0].name).to eq 'Sam Morgan'
    expect(users[0].username).to eq 'sjmog'

    expect(users[1].id).to eq '2'
    expect(users[1].email).to eq 'dkong@makersacademy.com'
    expect(users[1].password).to eq 'banana123'
    expect(users[1].name).to eq 'Donkey Kong'
    expect(users[1].username).to eq 'dkong'
  end

  it 'Finds user by id' do
    repo = UserRepository.new

    user = repo.find(1)

    expect(user.id).to eq '1'
    expect(user.email).to eq 'samm@makersacademy.com'
    expect(user.password).to eq 'password123'
    expect(user.name).to eq 'Sam Morgan'
    expect(user.username).to eq 'sjmog'
  end

  it 'Creates a new user' do
    new_user = User.new
    new_user.email = 'ppeach@makersacademy.com'
    new_user.password = 'princess456'
    new_user.name = 'Princess Peach'
    new_user.username = 'peach'
    repo = UserRepository.new
    repo.create(new_user)
    users = repo.all

    expect(users[-1].email).to eq 'ppeach@makersacademy.com'
    expect(users[-1].password).to eq 'princess456'
    expect(users[-1].name).to eq 'Princess Peach'
    expect(users[-1].username).to eq 'peach'
  end
end
