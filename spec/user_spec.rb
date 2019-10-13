require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(username: "user001", password: 'password123')
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.query("SELECT * FROM users")

    expect(user).to be_a User
    expect(user.username).to eq 'user001'
    expect(user.id).to eq result.first['id']
  end

  it 'hashes the password using Bcrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')

    User.create(username: 'user001', password: 'password123')
  end
end

describe '.find' do
  it 'finds a user by username' do
    user = User.create(username: "user001", password: 'password123')
    result = User.find(user.id)

    expect(result.id).to eq user.id
    expect(result.username).to eq user.username
  end

  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end

end
