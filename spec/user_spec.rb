require 'user'

describe User do
  it '.create makes a new user with an email and password' do
    user = User.create(email: 'test@example.com', password: 'password123')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data['id']
    expect(user.email).to eq 'test@example.com'
  end

  it '.create hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')

    User.create(email: 'test@example.com', password: 'password123')
  end

  it '.find finds a user by ID' do
    user = User.create(email: 'test@example.com', password: 'password123')
    result = User.find(id: user.id)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
  end

  it '.find returns nil if no id is given' do
    expect(User.find(id: nil)).to eq nil
  end
end
