require './lib/user'

describe User do
  it "creates a new user" do
    user = User.create(name: 'Test test', username: 'Test', email: 'test@example.com', password: 'password123')
    expect(user).to be_a User
    expect(user.name).to eq 'Test test'
    expect(user.username).to eq 'Test'
    expect(user.email).to eq 'test@example.com'
  end

  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')
    User.create(name: 'Test test', username: 'Test', email: 'test@example.com', password: 'password123')
  end
end
