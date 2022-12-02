require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  context "UserRepository" do
    it "can get a list of all users" do
      repo = UserRepository.new

      users = repo.all

      expect(users.first.id).to eq(1)
      expect(users.length).to eq(3)
      expect(users.first.email_address).to eq('remoteunderscore@gmail.com')
    end

    it "can retrieve a single user" do
      repo = UserRepository.new

      user = repo.find(1)
      expect(user.name).to eq('Mike Oliver')
      expect(user.username).to eq('mike')
    end

    it "can create a new user" do
      repo = UserRepository.new

      user = User.new
      user.name = 'Maisie McMaisie'
      user.username = 'maisie'
      user.email_address = 'maisie@mcmaisie.com'
      user.password = '123password'
      
      users = repo.all
      repo.create(user)
      
      last_user = users.last
      
      expect(last_user.email_address).to eq ('amy@amy.com')
      expect(last_user.username).to eq ('amy')
    end

    it "can delete a user" do
      repo = UserRepository.new
      users = repo.all
      repo.delete(1)

      expect(users.length).to eq(3)
      expect(users.first.id).to eq(1)
    end

    it "can update a user's details" do
      repo = UserRepository.new

      user = repo.find(1)
  
      user.name = 'Mikey Oliver'
      user.username = 'bob'
  
      repo.update(user)
  
      updated_user = repo.find(1)
  
      expect(updated_user.name).to eq('Mikey Oliver')
      expect(updated_user.username).to eq('bob')
      end
    end
  end
  