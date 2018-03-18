require 'user'

describe User do
  before(:each) do
    @user = User.create(username: 'Tester', email: 'test@example.com', password: 'password123')
  end
  describe '.all' do
  it 'returns all users, wrapped in a User instance' do
    expect(User.all.map(&:id)).to include @user.id
  end
end
  describe '#create' do
  it 'creates a new user' do
    expect(@user.id).not_to be_nil
  end
end
  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')
    User.create(username: 'Tester', email: 'test@example.com', password: 'password123')
  end
end
  describe '#find' do
    it 'finds a user by ID' do
      @user = User.create(username: 'Tester', email: 'test@example.com', password: 'password123')
      expect(User.find(@user.id).email).to eq @user.email
    end
  end
