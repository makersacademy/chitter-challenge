require_relative '../lib/user'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = create_test_user
      persisted_user = User.find_by_id(id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_user.id
      expect(user.user_name).to eq persisted_user.user_name
      expect(user.name).to eq persisted_user.name
      expect(user.email).to eq persisted_user.email
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      create_test_user
    end

    it 'does not allow duplicate email addresses' do
      create_test_user
      user = User.create(
        email: 'test@example.com', 
        password: 'password123', 
        user_name: 'different name', 
        name: 'Test User'
      )
      expect(user).to be_nil
    end

    it 'does not allow duplicate usernames' do
      create_test_user
      user = User.create(
        email: 'different@example.com', 
        password: 'password123', 
        user_name: 'testusername', 
        name: 'Test User'
      )
      expect(user).to be_nil
    end

    it 'does not allow an empty email address' do
      user = User.create(
        email: '', 
        password: 'password123', 
        user_name: 'testusername', 
        name: 'Test User'
      )
      expect(user).to be_nil
    end

    it 'does not allow an empty password' do
      user = User.create(
        email: 'test@test.com', 
        password: '', 
        user_name: 'testusername', 
        name: 'Test User'
      )
      expect(user).to be_nil
    end

    it 'does not allow an empty user_name' do
      user = User.create(
        email: 'test@test.com', 
        password: 'password123', 
        user_name: '', 
        name: 'Test User'
      )
      expect(user).to be_nil
    end

    it 'does not allow an empty name' do
      user = User.create(
        email: 'test@test.com', 
        password: 'password123', 
        user_name: 'testusername', 
        name: ''
      )
      expect(user).to be_nil
    end

  end

  describe ".find_by_id" do
    it 'finds a user by ID' do
      user = create_test_user
      persisted_user = User.find_by_id(id: user.id)
  
      expect(persisted_user.id).to eq user.id
      expect(persisted_user.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find_by_id(id: nil)).to eq nil
    end
  end

  describe ".authenticate" do
    before(:each) do
      @user = create_test_user
    end

    it 'returns a user given a correct username and password, if one exists' do
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')

      expect(authenticated_user.id).to eq @user.id
    end

    it 'returns nil given an incorrect email address' do
      expect(User.authenticate(email: 'wrongemail@mail.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
    end

  end

end
