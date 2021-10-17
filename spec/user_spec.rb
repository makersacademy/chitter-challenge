require 'user'
require 'database_helpers'

describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'test@example.com', password: 'hunter2')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@example.com'
  end
  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('hunter2')
    User.create(email: 'test@example.com', password: 'hunter2')
  end
end

describe '.find' do
  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end
  it 'finds a user by ID' do
    user = User.create(email: 'test@example.com', password: 'hunter2')
    result = User.find(user.id)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
  end
end
