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

  context '#create' do
    it 'creates a new user' do
      repo = UserRepository.new
      user = User.new
      user.email = 'email@example.com'
      user.password = '123'
      user.name = 'Jim'
      user.username = 'jimmmmeee'

      repo.create(user)

      new_user_id = repo.log_in('email@example.com', '123')
      expect(new_user_id).to eq 3
    end

    it 'returns an error if duplicate email' do
      repo = UserRepository.new
      user = User.new
      user.email = 'fred@example.com'
      user.password = '123'
      user.name = 'Freddie'
      user.username = 'freddie'

      expect { repo.create(user) }.to raise_error(PG::UniqueViolation)
    end

    it 'returns an error if duplicate username' do
      repo = UserRepository.new
      user = User.new
      user.email = 'freddie@example.com'
      user.password = '123'
      user.name = 'Freddie'
      user.username = 'freddo'

      expect { repo.create(user) }.to raise_error(PG::UniqueViolation)
    end
  end

  context '#log_in' do
    it 'logs a user in' do
      repo = UserRepository.new
      user_id = repo.log_in('fred@example.com', '123')
      expect(user_id).to eq 2
    end

    it 'returns nil if email is incorrect' do
      repo = UserRepository.new
      user_id = repo.log_in('fred@gmail.com', '123')
      expect(user_id).to eq nil
    end

    it 'returns nil if password incorrect' do
      repo = UserRepository.new
      user_id = repo.log_in('fred@example.com', '12')
      expect(user_id).to eq nil
    end
  end

  context '#tag_users' do
    it 'creates a tag for each user tagged' do
      repo = UserRepository.new
      expect { repo.tag_users(1, 'bob678, freddo') }.not_to raise_error
    end
  end

  context '#find_by_username' do
    it 'finds a user by username' do
      repo = UserRepository.new
      user = repo.find_by_username('bob678')
      expect(user.name).to eq 'Bob'
      expect(user.email).to eq 'hello@example.com'
    end
  end
end
