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
      user.email = 'email@gmail.com'
      user.password = '123'
      user.name = 'Jim'
      user.username = 'jimmmmeee'

      repo.create(user)

      new_user_id = repo.log_in('email@gmail.com', '123')
      expect(new_user_id).to eq '3'
    end

    # it 'does not create a user if any field is blank' do
    #   repo = UserRepository.new
    #   user = User.new
    #   user.email = ''
    #   user.password = '123'
    #   user.name = 'Jim'
    #   user.username = 'jimmmmeee'

    #   expect { repo.create(user) }.to raise_error "fields should not be blank"
    # end
  end

  context '#log_in' do
    it 'logs a user in' do
      repo = UserRepository.new
      repo.log_in('fred@gmail.com', '123')
    end
  end
end
