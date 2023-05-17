require "user_repository"

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_tables.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_tables
  end

  it 'returns all user accounts' do
    repo = UserRepository.new
    users = repo.all
    expect(users.length).to eq 2
    expect(users.first.name).to eq 'Aubrey Salmins'
    expect(users.last.name).to eq 'Budsy'
  end

  it 'returns one user' do
    repo = UserRepository.new
    user = repo.find(1)
    expect(user.id).to eq 1
    expect(user.name).to eq 'Aubrey Salmins'
  end

  it 'creates a new user' do
    repo = UserRepository.new
    user = double(:user, name: 'Third One', username: 'I am no. 3', password: 'pswrdz', email: 'no3@account.fm')
    repo.create(user)
    user = repo.find(3)
    expect(user.name).to eq "Third One"
  end
end