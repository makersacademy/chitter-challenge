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
