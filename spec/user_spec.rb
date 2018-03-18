describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'test@example.com', username: 'Chiaki Mizuta', userhandle: 'chiakimz', password: 'password123')

    expect(user.id).not_to be_nil
  end
  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')
    User.create(email: 'test@example.com', username: 'Chiaki Mizuta', userhandle: 'chiakimz', password: 'password123')
  end  
end

describe '.all' do
  it 'returns all users, wrapped in a User instance' do
    user = User.create(email: 'test@example.com', username: 'Chiaki Mizuta', userhandle: 'chiakimz', password: 'password123')
    expect(User.all.map(&:id)).to include user.id
  end
end

describe '.find' do
  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end
  it 'finds a user by ID' do
    user = User.create(email: 'test@example.com', username: 'Chiaki Mizuta', userhandle: 'chiakimz', password: 'password123')

    expect(User.find(user.id).email).to eq user.email
  end
end
