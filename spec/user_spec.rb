require 'database_helpers'

describe '#create' do
  it 'creates a new user' do
    user = User.create(fullname: 'Pusheen Cat', username: '@pusheen', email: 'pusheen@test.com', password: 'pusheen-password')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.username).to eq '@pusheen'
  end

  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('pusheen-password')

    User.create(fullname: 'Pusheen Cat', username: '@pusheen', email: 'pusheen@test.com', password: 'pusheen-password')
  end

end

describe '#find' do
  it 'finds a user by ID' do
    user = User.create(fullname: 'Pusheen Cat', username: '@pusheen', email: 'pusheen@test.com', password: 'pusheen-password')
    
    result = User.find(id: user.id)

    expect(result.id).to eq user.id
    expect(result.username).to eq user.username
  end

  it 'returns nil if there is no ID given' do
    expect(User.find(id: nil)).to eq nil
  end

end

describe '#authenticate' do
  it 'returns a user given a correct username and password, if one exists' do
    user = User.create(fullname: 'Pusheen Cat', username: '@pusheen', email: 'pusheen@test.com', password: 'pusheen-password')
    authenticated_user = User.authenticate(username: '@pusheen', password: 'pusheen-password')

    expect(authenticated_user.id).to eq user.id
  end
end