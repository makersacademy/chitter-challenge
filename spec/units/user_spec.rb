require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        first_name: 'Test', last_name: 'User', username: 'test123',
        email: 'test@test.com', password: '12345'
      )
      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.first_name).to eq 'Test'
      expect(user.last_name).to eq 'User'
      expect(user.username).to eq 'test123'
      expect(user.email).to eq  'test@test.com'
      expect(user.password).to eq persisted_data['password']
    end
    
    it 'encrypts the password' do
      user = User.create(
        first_name: 'Password', last_name: 'Tester', username: 'passwordtest',
        email: 'password@test.com', password: 'abc123'
      )
      persisted_data = persisted_data(table: 'users', id: user.id)

      db_stored_password = persisted_data['password']
      hashed_password = BCrypt::Password.new(persisted_data['password'])

      expect(db_stored_password).not_to eq('abc123')
      expect(db_stored_password).to eq(hashed_password)
      expect(hashed_password).to eq('abc123')
      # Bcrypt stores a hash and knows it is equivalent to the raw password when compared with ==
    end

    it 'only creates accounts with a unique username' do
      user = User.create(
        first_name: 'Test', last_name: 'User', username: 'test123',
        email: 'test@test.com', password: '12345'
      )
      expect {
        User.create(
          first_name: 'Other', last_name: 'User', username: 'test123',
          email: 'otheremail@test.com', password: '12345'
        )
      }.to raise_error(PG::UniqueViolation, /\(username\)=\(test123\) already exists/)
    end

    it 'only creates accounts with a unique email' do
      user = User.create(
        first_name: 'Test', last_name: 'User', username: 'test123',
        email: 'test@test.com', password: '12345'
      )
      expect {
        User.create(
          first_name: 'Other', last_name: 'User', username: 'test456',
          email: 'test@test.com', password: '12345'
        )
      }.to raise_error(PG::UniqueViolation, /\(email\)=\(test@test.com\) already exists/)
    end
  end

  describe '.find' do
    it 'finds a user by id' do
      user = User.create(
        first_name: 'Test', last_name: 'User', username: 'test123',
        email: 'test@test.com', password: '12345'
      )
      result = User.find(id: user.id)
  
      expect(result.id).to eq user.id
      expect(result.first_name).to eq user.first_name
      expect(result.last_name).to eq user.last_name
      expect(result.username).to eq user.username
      expect(result.email).to eq user.email
      expect(result.password).to eq user.password
    end
  end
end
