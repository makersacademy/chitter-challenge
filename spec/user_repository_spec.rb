require "user_repository"

def reset_chitter_tables
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_chitter_tables
  end

  it 'gets all users' do
    repo = UserRepository.new

    users = repo.all

    expect(users.length).to eq  2

    expect(users[0].id).to eq  1
    expect(users[0].name).to eq  'Caroline'
    expect(users[0].email).to eq  'carolinesemail@email.com'
    expect(users[0].username).to eq 'caro'

    expect(users[1].id).to eq  2
    expect(users[1].name).to eq  'Philip'
    expect(users[1].email).to eq  'philsemail@email.com'
    expect(users[1].username).to eq 'phil'

  end

  it 'finds a user by username' do
    repo = UserRepository.new

    user = repo.find_by_username('phil')

    expect(user.id).to eq  2
    expect(user.name).to eq  'Philip'
    expect(user.email).to eq  'philsemail@email.com'
    expect(user.username).to eq 'phil'
  end

  it 'finds a user by user ID' do
    repo = UserRepository.new

    user = repo.find(2)

    expect(user.id).to eq  2
    expect(user.name).to eq  'Philip'
    expect(user.email).to eq  'philsemail@email.com'
    expect(user.username).to eq 'phil'
  end

  it 'creates a new user' do
    user = User.new
    user.name = 'Pip'
    user.email =  'pipsemail@email.com'
    user.username = 'pip1'

    repo = UserRepository.new

    repo.create(user)

    last_user = repo.find_by_username('pip1')

    expect(last_user.id).to eq  3
    expect(last_user.name).to eq  'Pip'
    expect(last_user.email).to eq  'pipsemail@email.com'
    expect(last_user.username).to eq 'pip1'

  end

  it 'finds all tagged users for a given peep' do
    repo = UserRepository.new

    users = repo.get_tagged_users(1)

    expect(users.length).to eq  1

    expect(users[0].id).to eq  2
    expect(users[0].name).to eq  'Philip'
    expect(users[0].email).to eq  'philsemail@email.com'
    expect(users[0].username).to eq 'phil'

  end

end