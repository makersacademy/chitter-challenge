require 'database_helpers'
require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'test@gmail.com', password: 'password123', name: 'Jordan', username: 'jordanschitter')

    persisted_data = persisted_data(id: user.id)

    expect(user).to be_a User
    expect(user.email).to eq 'test@gmail.com'
  end
end
describe '.find' do
  it 'finds a user by ID' do
    user = User.create(email: 'test@gmail.com', password: 'password123', name: 'Jordan', username: 'jordanschitter')
    result = User.find(id: user)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
    expect(result.name).to eq user.name
    expect(result.username).to eq user.username
  end
  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end
  describe '.create' do 
    it 'hases the password using BCcrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@gmail.com', password: 'password123', name: 'Jordan', username: 'jordanschitter')
    end
  end
end