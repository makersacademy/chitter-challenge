require 'database_helpers'
require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'test@example.com', password: 'password123',
      name: 'testy mctestface', username: 'test123')
    
    persisted_data = persisted_data(table: :users, id: user.id)
    
    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@example.com'
    expect(user.name).to eq 'testy mctestface'
    expect(user.username).to eq 'test123'
  end
  it 'hashes the password using BCrypt' do 
    expect(BCrypt::Password).to receive(:create).with('password123')

    User.create(email: 'test@example.com', password: 'password123', name: 'testy mctestface', username: 'test123')
  end
end

describe '.find' do
  it 'finds a user by ID' do
    user = create_test_user
    result = User.find(user.id)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
    expect(result.name).to eq user.name
    expect(result.username).to eq user.username
  end

  it 'returns Guest if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end

  describe '#authenticate' do
    it 'returns a user given a correct username and password' do
      user = create_test_user
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')

      expect(authenticated_user.id).to eq user.id
    end
    it 'returns nil given an incorrect email' do
      user = create_test_user
      expect(User.authenticate(email: 'incorrectemail@me.com', password: 'password123')).to be_nil
    end
    it 'returns nil given an incorrect password' do
      user = create_test_user
      expect(User.authenticate(email: 'test@example.com', password: 'incorrectpassword')).to be_nil
    end
  end
end
