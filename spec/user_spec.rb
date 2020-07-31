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
end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create(email: 'test@example.com', password: 'password123', name: 'testy mctestface', username: 'test123')
    result = User.find(user.id)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
    expect(result.name).to eq user.name
    expect(result.username).to eq user.username
  end

  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end
end