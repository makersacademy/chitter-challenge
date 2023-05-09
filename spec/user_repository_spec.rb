require 'user_repository'

describe UserRepository do
  before(:each) do
    reset_users_table
  end

  describe '#all' do
    it 'returns a list of all users' do
      repo = UserRepository.new
      users = repo.all

      expect(users.length).to eq 4

      expect(users).to include(
        have_attributes(
          id: 1,
          email: 'email_1',
          password: 'password_1',
          name: 'name_1',
          username: 'username_1'
        )
      )

      expect(users).to include(
        have_attributes(
          id: 3,
          email: 'email_3',
          password: 'password_3',
          name: 'name_3',
          username: 'username_3'
        )
      )
    end
  end

  describe '#find' do
    it 'returns a user by id' do
      repo = UserRepository.new
      user = repo.find(1)
      expect(user.id).to eq 1
      expect(user.email).to eq 'email_1'
      expect(user.password).to eq 'password_1'
      expect(user.name).to eq 'name_1'
      expect(user.username).to eq 'username_1'
    end

    it 'returns another user by id' do
      repo = UserRepository.new
      user = repo.find(3)
      expect(user.id).to eq 3
      expect(user.email).to eq 'email_3'
      expect(user.password).to eq 'password_3'
      expect(user.name).to eq 'name_3'
      expect(user.username).to eq 'username_3'
    end
  end

  describe '#create' do
    it "creates a new user in the database" do
      user = User.new
      user.email = 'new_email'
      user.password = 'new_password'
      user.name = 'new_name'
      user.username = 'new_username'
      
      repo = UserRepository.new
      repo.create(user)
      
      expect(repo.all).to include(
        have_attributes(
          id: 5,
          email: 'new_email',
          name: 'new_name',
          username: 'new_username'
        )
      )
    end
    
    it "encrypts the password" do
      user = User.new
      user.email = 'new_email'
      user.password = 'new_password'
      user.name = 'new_name'
      user.username = 'new_username'
      
      repo = UserRepository.new
      repo.create(user)

      stored_user = repo.find(5)
      expect(stored_user.password).not_to eq 'new_password'

      stored_password = BCrypt::Password.new(stored_user.password)
      expect(stored_password).to eq 'new_password'
    end
  end

  describe 'username_exists?' do
    it 'returns true if the username already exists in the database' do
      repo = UserRepository.new
      expect(repo.username_exists?('username_1')).to eq true
    end
    
    it 'returns false if the username does not exist in the database' do
      repo = UserRepository.new
      expect(repo.username_exists?('new_username')).to eq false
    end
  end
  
  describe 'email_exists?' do
    it 'returns true if the email already exists in the database' do
      repo = UserRepository.new
      expect(repo.email_exists?('email_1')).to eq true
    end
    
    it 'returns false if the email does not exist in the database' do
      repo = UserRepository.new
      expect(repo.email_exists?('new_email')).to eq false
    end
  end
end
