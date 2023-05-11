require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds_chitter_test.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_users_table
  end

  context '#find_by_email' do
    it 'finds a single user by their email' do
      repo = UserRepository.new
      user = repo.find_by_email('hello@gmail.com')
      expect(user.name).to eq 'Bob'
      expect(user.username).to eq 'bob678'
    end
  end

  context '#create' do
    it 'creates a new user' do
      repo = UserRepository.new
      user = User.new
      user.email = 'email@gmail.com'
      user.password = '123'
      user.name = 'Jim'
      user.username = 'jimmmmeee'

      repo.create(user)
      
      new_user = repo.find_by_email('email@gmail.com')
      expect(new_user.email).to eq 'email@gmail.com'
      expect(new_user.name).to eq 'Jim'
      expect(new_user.password).to_not eq '123'
      expect(new_user.username).to eq 'jimmmmeee'
    end
  end

  context '#log_in' do
    it 'logs a user in' do
      repo = UserRepository.new
      repo.log_in('fred@gmail.com', '123')
    end
  end
end
