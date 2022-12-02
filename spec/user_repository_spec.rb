require 'user_repository'

RSpec.describe UserRepository do 

  def reset_users_table
    seed_sql = File.read('spec/seeds_chitter_challenge.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
  end
  
  describe UserRepository do
    before(:each) do 
      reset_users_table
    end
  
    it 'Get all users' do
      repo = UserRepository.new
      users = repo.all

      expect(users.length).to eq 2

      expect(users[0].id).to eq 1
      expect(users[0].name).to eq 'First Name'
      expect(users[0].email).to eq 'firstname@email.com'
      expect(users[0].password).to eq 'abc123'
      expect(users[0].username).to eq 'firstname'

      expect(users[1].id).to eq 2
      expect(users[1].name).to eq 'Second Name'
      expect(users[1].email).to eq 'secondname@email.com'
      expect(users[1].password).to eq 'defgh456'
      expect(users[1].username).to eq 'secondname'
    end
    
    it 'Get a single user' do 
      repo = UserRepository.new

      user = repo.find(1)

      expect(user.id).to eq 1
      expect(user.name).to eq 'First Name'
      expect(user.email).to eq 'firstname@email.com'
      expect(user.password).to eq 'abc123'
      expect(user.username).to eq 'firstname'
    end

    it 'Creates a new user' do 
      repo = UserRepository.new

      user = User.new
      user.name = 'Third Name'
      user.email = 'thirdname@email.com'
      user.password = 'abcd1234'
      user.username = 'thirdname'

      repo.create(user)

      all_users = repo.all
      last_user = all_users.last

      expect(last_user.name).to eq 'Third Name'
      expect(last_user.email).to eq 'thirdname@email.com'
      # expect(last_user.password).to eq 'abcd1234'
      expect(last_user.username).to eq 'thirdname'
    end
  end
end
