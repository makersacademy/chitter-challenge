require 'user'
require 'database_helpers'

describe '.create' do
  it 'creates a new user' do
 
    user = User.create(name: 'test', email: 'test@example.com', password: 'password123')

    persisted_data = persisted_data(id: user.id, table: 'users')

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@example.com'
  end
end

describe '.find' do
  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end

  it 'finds a user by ID' do
    user = User.create(email: 'test@example.com', password: 'password123')
    result = User.find(id: user)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
  end
end