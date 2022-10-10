require_relative '../lib/user'
require_relative '../lib/user_repository'

def reset_chitter_table
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end
  
describe UserRepository do
  before(:each) do 
    reset_chitter_table
  end

  it 'returns all users' do
    repo = UserRepository.new

    users = repo.all
    
    expect(users.length).to eq(3)
    expect(users.first.username).to eq('ollie')
  end

  it 'finds a user' do
    repo = UserRepository.new

    user = repo.find(1)
    
    expect(user.id).to eq(1)
    expect(user.username).to eq('ollie')
    expect(user.email_address).to eq('ollie@gmail.com')
  end

  it 'creates a user' do
    repo = UserRepository.new

    user = User.new
    user.username = 'marie'
    user.email_address = 'marie@gmail.com'
    user.password = 'koala'
    
    repo.create(user)

    users = repo.all

    expect(users.length).to eq(4)
    expect(users.last.username).to eq('marie')
  end
end
