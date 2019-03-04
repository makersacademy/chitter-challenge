require 'database_helpers'
require 'user'


describe '.create' do
  it 'creates a new user' do

    user = User.create(username: 'Anu', password: 'password123')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.username).to eq 'Anu'
  end
end

describe '.create' do
  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')
    User.create(username: 'Anu', password: 'password123')
  end
end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create(username: 'Anu', password: 'password123')
    result = User.find(id: user)

    expect(result.id).to eq user.id
    expect(result.username).to eq user.username
  end
end

describe '.find' do
  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil

  end
end

describe '.authenticate' do
  it 'returns a user given a correct username and password, if one exists' do
    user = User.create(username: 'Anu', password: 'password123')
    authenticated_user = User.authenticate('Anu', 'password123')

    expect(authenticated_user.id).to eq user.id
  end
end

describe '.authenticate' do
  it 'returns nil given incorrect username address' do
    user = User.create(username: 'Anu', password: 'password123')
    expect(User.authenticate(username: 'nottherightusername', password: 'password123')).to be_nil
  end
end

describe '.authenticate' do
  it 'returns nil given incorrect password' do
    user = User.create(username: 'Anu', password: 'password123')
    expect(User.authenticate(username: 'Anu', password: 'wrongpassword')).to be_nil
  end
end
