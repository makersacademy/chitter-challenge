require 'user'
require 'database_helpers'

describe '.create' do
  it 'creates a new user' do
    user = User.create(user_name: 'Danielle', password: 'password123')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.user_name).to eq 'Danielle'
  end
end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create(user_name: 'Danielle', password: 'password123')
    result = User.find(id: user)

    expect(result.id).to eq user.id
    expect(result.user_name).to eq user.user_name
  end

  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end
end