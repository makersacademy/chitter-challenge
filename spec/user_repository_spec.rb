
require 'user_repository'
require 'user'

def reset_users_table
  seed_sql = File.read('spec/seeds/users_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

def reset_peeps_table
  seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_peeps_table
    reset_users_table
  end

  context '#all' do
    it 'returns the correct amount of users in the database' do
      repo = UserRepository.new
      users = repo.all

      expect(users.length).to eq(4)
    end

    it 'returns correct data for user' do
      repo = UserRepository.new
      users = repo.all

      expect(users[0].id).to eq(1)
      expect(users[0].name).to eq('Konrad')
      expect(users[0].username).to eq('kdun')
      expect(users[0].email).to eq('konrad@gmail.com')
      expect(users[0].password).to eq('konrad')
    end

    it 'returns correct data for user' do
      repo = UserRepository.new
      users = repo.all

      expect(users[3].id).to eq(4)
      expect(users[3].name).to eq('Jellybean')
      expect(users[3].username).to eq('jelly')
      expect(users[3].email).to eq('jelly@hotmail.com')
      expect(users[3].password).to eq('feedme')
    end
  end

  context '#find' do
    it 'returns a user with correct id' do
      repo = UserRepository.new
      user = repo.find(1)

      expect(user.id).to eq(1)
      expect(user.username).to eq('kdun')
    end
  end

  context '#create' do
    it 'returns the correct amount of users in the database and correct data' do
      repo = UserRepository.new
      new_user = User.new

      new_user.name = 'Joanna'
      new_user.username = 'jojo'
      new_user.email = 'joanna@pudelek.pl'
      new_user.password = 'terminatorj12'

      repo.create(new_user)

      users = repo.all

      expect(users.length).to eq(5)
      expect(users.last.name).to eq('Joanna')
      expect(users.last.username).to eq('jojo')
      expect(users.last.email).to eq('joanna@pudelek.pl')
      expect(users.last.password).to eq('terminatorj12')
    end

    it 'fails to create a new user account because of existing username' do
      repo = UserRepository.new
      new_user = User.new

      new_user.name = 'Joanna'
      new_user.username = 'kdun'
      new_user.email = 'joanna@pudelek.pl'
      new_user.password = 'terminatorj12'

      expect(repo.create(new_user)).to eq('The username is already registered!')
    end

    it 'fails to create a new user account because of existing email' do
      repo = UserRepository.new
      new_user = User.new

      new_user.name = 'Joanna'
      new_user.username = 'jojo'
      new_user.email = 'konrad@gmail.com'
      new_user.password = 'terminatorj12'

      expect(repo.create(new_user)).to eq('The email is already registered!')
    end
  end

  context '#username_check' do
    it 'returns true if the username already exists' do
      repo = UserRepository.new
      expect(repo.username_check('kdun')).to eq(true)
    end

    it 'returns false if the username does not already exist' do
      repo = UserRepository.new
      expect(repo.username_check('kdawg')).to eq(false)
    end
  end

  context '#email_check' do
    it 'returns true if the email already exists' do
      repo = UserRepository.new
      expect(repo.email_check('konrad@gmail.com')).to eq(true)
    end

    it 'returns false if the email does not already exist' do
      repo = UserRepository.new
      expect(repo.email_check('kdawg@harvard.edu')).to eq(false)
    end
  end
end
