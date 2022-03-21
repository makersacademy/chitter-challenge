require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(username: 'test123', password: 'password12')

    expect(user).to be_a User
    expect(user.username).to eq 'test123'
  end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password12')
  
      User.create(username: 'test123', password: 'password12')
    end

end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create(username: 'test123', password: 'password12')
    result = User.find(user.id)

    expect(result.id).to eq user.id
    expect(result.username).to eq user.username
  end

end

describe '.authenticate' do
  it 'returns a user given a correct username and password, if one exists' do
    user = User.create(username: 'test12', password: 'password12')
    
    authenticated_user = User.authenticate('test12', 'password12')

    expect(authenticated_user.id).to eq user.id
  end

  it 'returns nil given an incorrect username' do
    user = User.create(username: 'test12', password: 'password12')

    expect(User.authenticate('nottherightusername', 'password123')).to be_nil
  end

  it 'returns nil given an incorrect password' do
    user = User.create(username: 'test12', password: 'password12')

    expect(User.authenticate('test12', 'password123')).to be_nil
  end

end
