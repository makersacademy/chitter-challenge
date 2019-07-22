require 'user'
require 'database_helpers'

describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'test@example.com', password: 'password123', name: 'Test User', username: 'test_user')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@example.com'
  end
end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create(email: 'test@example.com', password: 'password123', name: 'Test User', username: 'test_user')
    result = User.find(id: user.id)
    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
  end


  it 'returns nil if there is no ID given' do
    expect(User.find(id: nil)).to eq nil
  end

end
