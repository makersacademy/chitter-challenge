require 'database_helper'
require_relative '../lib/user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'test@test.com', password: 'password123')
    persisted_data = persisted_data(table: :users, id: user.id)
    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@test.com'
  end

  it 'encrypts the password' do
    expect(BCrypt::Password).to receive(:create).with('defaultpassword')
    User.create(email: 'test@gmail.com', password: 'defaultpassword')
  end
end

describe '.find' do
  it 'finds users from the user ID' do
    user = User.create(email: 'test2@test.com', password: 'pa55word123')
    result = User.find(id = user.id)
    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
  end

  it 'returns nil if no ID provided' do
    expect(User.find(nil)).to eq nil
  end
end