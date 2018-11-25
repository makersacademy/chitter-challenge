require_relative '../lib/users.rb'
require 'database_helpers'

describe '.create' do
  it 'creates a new user' do
    user = Users.create(username: 'kie', email: 'test@example.com', password: 'password123', )

    persisted_data = persisted_data(id: user.id, table: 'users')

    expect(user).to be_a Users
    expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@example.com'
  end
end

describe '.find' do
  it 'finds a user by ID' do
    user = Users.create(username: 'kie', email: 'test@example.com', password: 'password123')
    result = Users.find(id: user)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
  end
end

describe '.find' do
  it 'returns nil if there is no ID given' do
    expect(Users.find(nil)).to eq nil
  end
end
