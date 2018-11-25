require_relative '../database_helpers'
require_relative '../../lib/models/user'
require 'bcrypt'

describe '#create' do
  it 'creates a new user' do
    user = User.create(user_name: '@testuser',
                       email: 'test_email@not_real.com',
                       password: 'password123',
                       name: 'Joe Bloggs')
    expect(user).to be_a User
    expect(user.id).to eq persisted_data(table: 'users', id: '1').first['id']
    expect(user.user_name).to eq persisted_data(table: 'users', id: '1').first['user_name']
    expect(user.email).to eq persisted_data(table: 'users',id: '1').first['email']
    expect(user.name).to eq persisted_data(table: 'users',id: '1').first['name']
  end

  it 'encrypts the password' do
    expect(BCrypt::Password).to receive(:create).with('password123')
    User.create(user_name: '@testuser',
                email: 'test_email@not_real.com',
                password: 'password123',
                name: 'Joe Bloggs')
  end
end

describe '#find' do
  it 'finds a user by ID' do
    user = User.create(user_name: '@testuser',
                       email: 'test_email@not_real.com',
                       password: 'password123',
                       name: 'Joe Bloggs')
    result = User.find(user.id)

    expect(result).to be_a User
    expect(result.id).to eq user.id
    expect(result.user_name).to eq user.user_name
    expect(result.email).to eq user.email
    expect(result.name).to eq user.name
  end

  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end
end

describe '#authenticate' do
  it 'returns a user given a correct username and password, if one exists' do
    user = User.create(user_name: '@testuser',
                       email: 'test_email@not_real.com',
                       password: 'password123',
                       name: 'Joe Bloggs')
    authenticated_user = User.authenticate(email: 'test_email@not_real.com', password: 'password123')

    expect(authenticated_user.id).to eq user.id
  end

  it 'returns nil if given an incorrect email address' do
    User.create(user_name: '@testuser',
                email: 'test_email@not_real.com',
                password: 'password123',
                name: 'Joe Bloggs')
    expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
  end

   it 'returns nil given an incorrect password' do
     User.create(user_name: '@testuser',
                 email: 'test_email@not_real.com',
                 password: 'password123',
                 name: 'Joe Bloggs')

    expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
  end
end
