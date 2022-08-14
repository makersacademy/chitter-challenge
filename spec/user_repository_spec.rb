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

  context 'username must be unique' do
    it 'throws an error message if username is already in the database/in use' do
      repo = UserRepository.new
      new_user = User.new
      
      new_user.id = '4'
      new_user.name = 'Fleur'
      new_user.email = 'fleuremail@test.com'
      new_user.username = 'itsfleurduh'
      new_user.password = 'password123'
      repo.create(new_user)

      new_user.id = '5'
      new_user.name = 'fleur'
      new_user.email = 'anotherfleuremail@test.com'
      new_user.username = 'itsfleurduh'
      new_user.password = 'password123'

      expect { repo.create(new_user) }.to raise_error "That username is already in use."
    end
  end


end