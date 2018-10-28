require 'user'
require 'persisted_data_helpers'

describe '.sign_up' do
  it 'creates a new user' do
    user = User.sign_up(email: 'test@example.com', password: 'password123', username: 'apple123', name: 'tasha')
    persisted_data = persisted_data(table: :users, id: user.id)
    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@example.com'
  end
  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('hello')
    User.sign_up(email: 'test@example.com', password: 'hello', username: 'apple123', name: 'tasha')
  end
end

describe '.sign_in' do
  it 'returns a user given a correct username and password, if one exists' do
    user = User.sign_up(email: 'test@example.com', password: 'password123', username: 'apple123', name: 'tasha')
    authenticated_user = User.sign_in(username: 'apple123', password: 'password123')
    expect(authenticated_user.id).to eq user.id
  end
  it 'returns nil given an incorrect username' do
    user = User.sign_up(email: 'test@example.com', password: 'password123', username: 'apple123', name: 'tasha')
    expect(User.sign_in(username: 'hello', password: 'password123')).to be_nil
  end
end
