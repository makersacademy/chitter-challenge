describe '.create' do
  it 'creates a new user' do
    user = User.create('ollie@ollie.com', 'password')

    expect(user).to be_a User
    expect(user.email).to eq 'ollie@ollie.com'
  end
end

describe '.create' do
  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password')
    User.create('ollie@ollie.com', 'password')
  end
end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create('ollie@ollie.com', 'password')
    result = User.find(user.id)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
  end
end

describe '.find' do
  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end
end