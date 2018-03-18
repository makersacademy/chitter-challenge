require 'user'

describe User do
  describe '#all' do
  it 'returns all users, wrapped in a User instance' do
    user = User.create(username: 'Tester', email: 'test@example.com', password: 'password123')
    expect(User.all.map(&:id)).to include user.id
  end
end
subject(:user) { described_class.create(username: 'Tester', email: 'test@example.com', password: 'password123') }
  describe '#create' do
  it 'creates a new user' do
    expect(user.id).not_to be_nil
  end
end
  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')
    User.create(username: 'Tester', email: 'test@example.com', password: 'password123')
  end
end
  describe '#find' do
    it 'finds a user by ID' do
      # this rspec did not work after refactoring tests to truncate before eahc one, this will cause it to add to db
      user = User.create(username: 'Tester', email: 'test@example.com', password: 'password123')
      expect(User.find(user.id).email).to eq user.email
    end
  describe '#authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(username: 'Tester', email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate('test@example.com', 'password123')
      expect(authenticated_user.id).to eq user.id
    end
    it 'returns nil given an incorrect email address' do
     expect(User.authenticate('nottherightemail@me.com', 'password123')).to be_nil
    end
    it 'returns nil given an incorrect password' do
      expect(User.authenticate('test@example.com', 'wrongpassword')).to be_nil
    end
  end
end
