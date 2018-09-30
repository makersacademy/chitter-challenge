# require 'test_helper'

describe '.create' do
  it 'creates a new user' do
    new_user = User.create(email: 'test@example.com', password: 'password123', name: 'sample', username: 'smpl')
    p new_user
    persisted_user = persisted_data(table: :users, id: new_user.id).first
    p persisted_user
    expect(new_user).to be_a User
    expect(new_user.id).to eq persisted_user['id']
    expect(new_user.email).to eq 'test@example.com'
    expect(new_user.name).to eq 'sample'
    expect(new_user.email).to eq persisted_user['email']
  end

  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')

    User.create(email: 'test@example.com', password: 'password123', name: 'sample', username: 'smpl')
  end
end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create(email: 'test@example.com', password: 'password123', name: 'sample', username: 'smpl')
    result = User.find(user.id)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
  end

  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end
end