require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds_chitters.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  it 'Gets all users' do
    repo = UserRepository.new

    users = repo.all

    expect(users.length).to eq 3

    expect(users[0].id).to eq 1
    expect(users[0].email).to eq 'samm@makersacademy.com'
    expect(users[0].password).to eq 'password123'
    expect(users[0].name).to eq 'Sam Morgan'
    expect(users[0].username).to eq 'sjmog'

    expect(users[1].id).to eq 2
    expect(users[1].email).to eq 'chonky@chonkersacademy.com'
    expect(users[1].password).to eq 'birdwird'
    expect(users[1].name).to eq 'Samuel Morganson'
    expect(users[1].username).to eq 'smorg'

    expect(users[2].id).to eq 3
    expect(users[2].email).to eq 'sleepy@sleepersacademy.com'
    expect(users[2].password).to eq 'zzzzzz'
    expect(users[2].name).to eq 'Tony Harrison'
    expect(users[2].username).to eq 'TZ'

  end

  it 'creates a new user' do
    repo = UserRepository.new

    new_user = User.new
    new_user.email = 'jumbomumbo@flumbo.com'
    new_user.password = 'flipflop'
    new_user.name = 'Bobby Boberson'
    new_user.username = 'BlobFlop'
    repo.create(new_user)

    users = repo.all

    expect(users.length).to eq(4)
    expect(users.last.email).to eq('jumbomumbo@flumbo.com')
    expect(users.last.password).to eq('flipflop')
    expect(users.last.name).to eq('Bobby Boberson')
    expect(users.last.username).to eq('BlobFlop')
  end

  it 'finds user by email' do
    repo = UserRepository.new

    user = repo.find_by_email('chonky@chonkersacademy.com')

    expect(user.id).to eq 2
    expect(user.name).to eq 'Samuel Morganson'
    expect(user.username).to eq 'smorg'
    
  end
end