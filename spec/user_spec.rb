require 'user'

describe User do
  it 'Allows a user to register' do
    test_user = User.create('Test user', 'testuser', 'testuser@email.com', 'Password123')
    expect(test_user.name).to eq 'Test user'
    expect(test_user.username).to eq 'testuser'
    expect(test_user.email).to eq 'testuser@email.com'
  end

  it 'Returns a list of all users' do
    test_user = User.create('Test user', 'testuser', 'testuser@email.com', 'Password123')
    expect(User.all[0]).to be_an_instance_of(User)
    expect(User.all[0].name).to eq 'Test user'
    expect(User.all[0].username).to eq 'testuser'
    expect(User.all[0].email).to eq 'testuser@email.com'
  end

  it 'Encrypts the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('Password123')
    User.create('Test user', 'testuser', 'testuser@email.com', 'Password123')
  end

  describe '#authenticate' do
    it 'Authenticates a user upon sign in' do
      test_user = User.create('Test user', 'testuser', 'testuser@email.com', 'Password123')
      authenticated_user = User.authenticate('testuser', 'Password123')
      expect(authenticated_user.id).to eq test_user.id
    end

    it 'Returns nil if an incorrect username is entered' do
      test_user = User.create('Test user', 'testuser', 'testuser@email.com', 'Password123')
      expect(User.authenticate('fakeuser', 'Password123')).to eq nil
    end
  end
end
