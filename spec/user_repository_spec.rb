require 'user_repository'
require 'user'

def reset_users_table
    seed_sql = File.read('spec/seeds/test_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end
  
  describe UserRepository do
    before(:each) do 
      reset_users_table
    end

  context 'all' do
    it 'retrieves all users and returns a list of them' do
      repo = UserRepository.new
      users = repo.all

      expect(users.length).to eq(2)
      expect(users.first.name).to eq('Alex')

      expect(users.last.name).to eq('Zeus')
    end
  end

  context 'create' do
    it 'creates a new user' do
      repo = UserRepository.new
      new_user = User.new

      new_user.id = '3'
      new_user.name = 'Max'
      new_user.email = 'maxemail@test.com'
      new_user.username = 'maxonthesax'
      new_user.password = 'maxpassword'

      repo.create(new_user)

      all_users = repo.all
      newest_user = all_users.last
      
      expect(all_users.length).to eq(3)
      expect(newest_user.id).to eq '3'
      expect(newest_user.name).to eq 'Max'
      expect(newest_user.email).to eq 'maxemail@test.com'
      expect(newest_user.username).to eq 'maxonthesax'
      expect(newest_user.password).to eq 'maxpassword'
    end
  end


end

# # 2.
# # Create a new user

# repo = UserRepository.new
# new_user = User.new

# new_user.name = 'Max'
# new_user.email = 'maxemail@test.com'
# new_user.username = 'maxonthesax'
# new_user.password = 'maxpassword'

# repo.create(new_user)

# users = repo.all
# last_user = users.last

# expect(last_user.name).to eq 'Max'
# expect(last_user.email).to eq 'maxemail@test.com'
# expect(last_user.username).to eq 'maxonthesax'
# expect(last_user.password).to eq 'maxpassword'
  