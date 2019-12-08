require 'database_helpers'

describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'test@example.com', password: 'password123', name: 'user321', username: 'username123' )
    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data['id']
    expect(user.email).to eq 'test@example.com'
  end

  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')

    User.create(email: 'test@example.com', password: 'password123', name: 'user321', username: 'username123' )
  end

  it 'returns a user given a correct username and password, if one exists' do
    user = User.create(email: 'test@example.com', password: 'password123', name: 'user321', username: 'username123' )
    authenticated_user = User.authenticate(username: 'username123', password: 'password123')

    expect(authenticated_user.id).to eq user.id
  end
end

  describe '.find' do

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end

    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'user321', username: 'username123' )
      result = User.find(user.id)
  
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'user321', username: 'username123')
      authenticated_user = User.authenticate(username: 'username123', password: 'password123')
  
      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect username' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'user321', username: 'username123')

      expect(User.authenticate(username: 'username098', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'user321', username: 'username123')

      expect(User.authenticate(username: 'username123', password: 'password098')).to be_nil
    end
  end
