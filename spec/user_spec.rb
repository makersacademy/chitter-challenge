require_relative 'database_helpers'
require_relative '../lib/user'


describe '.create' do
  it 'creates a new user' do
    user = User.create(username: 'Bob', name: 'Bob Bob', email: 'bob@bob.com', password: 'notbob')

    persisted_data = persisted_data(table: 'users', id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data['id']
    expect(user.username).to eq 'Bob'
    expect(user.name).to eq 'Bob Bob'
    expect(user.email).to eq "bob@bob.com"
  end

  it 'uses bcrypt to enmcypt the password' do
    expect(BCrypt::Password).to receive(:create).with('apassword')

    User.create(username: 'Spy', name: 'REDACTED', email: 'Not telling!', password: 'apassword')
  end
end

describe '.find' do
  it 'finds users by ID' do
    user = User.create(username: 'Bob', name: 'Bob Bob', email: 'bob@bob.com', password: 'notbob')
    result = User.find(user.id)

    expect(result.id).to eq user.id
    expect(result.name).to eq user.name
  end
end

describe '.authenticate' do
  it 'returns the correct user, if it exists' do
    user = User.create(username: "Janine", name: "Not Janine", email: 'anemail@janinemail.com', password: 'paswerd')
    authenticated = User.authenticate(username: 'Janine', password: 'paswerd')

    expect(authenticated.id).to eq user.id
  end
end