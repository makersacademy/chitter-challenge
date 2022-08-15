require 'user_repository'
require 'user'
require 'bcrypt'

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
      new_user.password = 'password123'

      repo.create(new_user)

      all_users = repo.all
      newest_user = all_users.last
      
      expect(all_users.length).to eq(3)
      expect(newest_user.id).to eq '3'
      expect(newest_user.name).to eq 'Max'
      expect(newest_user.email).to eq 'maxemail@test.com'
      expect(newest_user.username).to eq 'maxonthesax'
      # not sure how to test for password (as output will be different each time)
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

      expect { repo.create(new_user) }.to raise_error 
      # need to figure out try/catch as raise_error may not necessarily catch correct error
    end
  end

    context 'find_by_email' do
      it 'finds user from their email' do
        repo = UserRepository.new

        user = repo.find_by_email('alexemail@test.com')
        
        expect(user.id).to eq(1)
        expect(user.name).to eq('Alex')
      end
    end

    context 'log_in' do
      it 'successfully logs user in to their account if email and
      password match data stored in database' do
        repo = UserRepository.new
        user = User.new
        
        user.id = '6'
        user.name = 'Max'
        user.username = 'maxonthesax'
        user.email = 'maxemail@test.com'
        user.password = 'password123'
        repo.create(user)

        account = repo.log_in('maxemail@test.com', 'password123')

        expect(account.email).to eq user.email
        # not sure how to test for password (as output will be different each time)
      end
    end
  end


