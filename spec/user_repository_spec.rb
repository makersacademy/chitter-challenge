require 'user_repository'


def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_site_test' })
  connection.exec(seed_sql)
end

RSpec.describe UserRepository do
  before(:each) do
    reset_users_table
  end

  it 'returns an array of all users' do
    repo = UserRepository.new
    users = repo.all

    expect(users.length).to eq 2
    
    expect(users[0].id).to eq  1
    expect(users[0].email).to eq 'lou@chitter.com'
    expect(users[0].password).to eq 'password01'
    expect(users[0].name).to eq 'Louis'
    expect(users[0].username).to eq 'lpc'
    
    expect(users[1].id).to eq  2
    expect(users[1].email).to eq 'luce@chitter.com'
    expect(users[1].password).to eq 'password02'
    expect(users[1].name).to eq 'Lucy'
    expect(users[1].username).to eq 'leh'
  end

  it 'finds a single user' do
    repo = UserRepository.new

    user = repo.find(1)

    expect(user.id).to eq 1
    expect(user.email).to eq 'lou@chitter.com'
    expect(user.password).to eq 'password01'
    expect(user.name).to eq 'Louis'
    expect(user.username).to eq 'lpc'
  end

  context 'when creating new user' do
    it 'adds a new user to database' do
      repo = UserRepository.new
      user = User.new
      user.email = 'newemail@chitter.com'
      user.password = 'password03'
      user.name = 'Jon'
      user.username = 'doe'
      
      repo.create(user)
      
      new_user = repo.all.last
      
      expect(new_user.id).to eq 3
      expect(new_user.email).to eq 'newemail@chitter.com'
      expect(new_user.password).to eq 'password03'
      expect(new_user.name).to eq 'Jon'
      expect(new_user.username).to eq 'doe'
    end

    it 'throws an error when email already contained in database' do
      repo = UserRepository.new
      user = User.new
      user.email = 'lou@chitter.com'
      user.password = 'password03'
      user.name = 'Jon'
      user.username = 'doe'
      
      expect { repo.create(user) }.to raise_error "email already exists"
    end
    it 'throws an error when email already contained in database' do
      repo = UserRepository.new
      user = User.new
      user.email = 'jonny@chitter.com'
      user.password = 'password03'
      user.name = 'Jon'
      user.username = 'lpc'
      
      expect{ repo.create(user) }.to raise_error "username already exists"  
    end
  end

  it 'finds a single user and their peeps' do
    repo = UserRepository.new

    user = repo.find_with_peeps(1)
    expect(user.id).to eq 1
    expect(user.email).to eq 'lou@chitter.com'
    
    peep = user.peeps.first
    expect(peep.content).to eq 'First post'
    expect(peep.time).to eq '12:00:00'
  end
end