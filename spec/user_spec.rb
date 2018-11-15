require 'user'
require 'peep'
require 'database_helper'

describe 'Create' do
  it 'creates a new user' do
    user = User.create(name: 'name', email: 'sam@example.com', password: 'password123')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'sam@example.com'
  end
end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create(name: 'Sam', email: 'sam@example.com', password: 'password123')
    result = User.find(id: user)

    expect(result.id).to eq user.id
    expect(result).to eq user.name
  end
end
