require 'user_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_test_db.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_tables
  end

  it 'lists all of the users' do 
    repo = UserRepository.new

    users = repo.all

    expect(users.length).to eq(3) 

    expect(users[0].id).to eq('1') 
    expect(users[0].username).to eq('willj836') 
    expect(users[0].email).to eq('willj836@gmail.com') 

    expect(users[1].id).to eq('2') 
    expect(users[1].username).to eq('OptimusPrime') 
    expect(users[1].email).to eq('op123@hotmail.com') 
  end

  it 'creates a new user' do 
    repo = UserRepository.new

    new_user = User.new
    new_user.username = 'New User'
    new_user.email = 'newuser@newuser.com'
    new_user.password = 'new123'

    repo.create(new_user)

    expect(repo.all.last.username).to eq('New User')
    expect(repo.all.last.email).to eq('newuser@newuser.com')
  end

  context 'checking if a username is taken' do 
    it 'returns true if username is taken' do 
      repo = UserRepository.new 

      expect(repo.check_if_username_or_email_taken('willj836', 'aaa@gmail.com')).to eq(true)
    end

    it 'returns false if username is not taken' do 
      repo = UserRepository.new 

      expect(repo.check_if_username_or_email_taken('BillyBob', 'abc@gmail.com')).to eq(false)
    end

    it 'returns true if email is taken' do 
      repo = UserRepository.new 

      expect(repo.check_if_username_or_email_taken('Bumblebee', 'willj836@gmail.com')).to eq(true)
    end
  end

  it 'returns a user object from a user id' do 
    repo = UserRepository.new 

    user = repo.find_by_id(1)

    expect(user.username).to eq('willj836')
  end

  it 'returns a user object from a users username' do 
    repo = UserRepository.new 

    user = repo.find_by_username('willj836')

    expect(user.username).to eq('willj836')
    expect(user.name).to eq('Will Jones')
  end
end