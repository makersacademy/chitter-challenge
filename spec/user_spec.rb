require 'user'
describe User do
describe '.create' do
    it 'BCrypt gets the password' do
      expect(BCrypt::Password).to receive(:create).with('Test123')
      User.create( email: 'ppilecki@icloud.com', password: 'Test123', name: 'Patryk', username: 'Pil3q')
    end

    it 'creates a new user' do
      user = User.create( email: 'ppilecki@icloud.com', password: 'Test123', name: 'Patryk', username: 'Pil3q')
      expect(user.id).not_to be_nil
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create( email: 'ppilecki@icloud.com', password: 'Test123', name: 'Patryk', username: 'Pil3q')
      expect(User.find(user.id).email).to eq user.email
    end
  end
  
  describe '.authenticate' do
  it 'Authenticate the user and return a User' do
    user = User.create( email: 'ppilecki@icloud.com', password: 'Test123', name: 'Patryk', username: 'Pil3q')
    auth_user = User.authenticate('ppilecki@icloud.com', 'Test123')
    expect(auth_user.id).to eq user.id
  end

  it 'returns nil when wrong email' do
    user = User.create(email: 'ppilecki@icloud.com', password: 'Test123', name: 'Patryk', username: 'Pil3q')
    expect(User.authenticate('wrong@verybad.com', 'Test123')).to be_nil
  end

  it 'returns nil when wrong password' do
    user = User.create(email: 'ppilecki@icloud.com', password: 'Test123', name: 'Patryk', username: 'Pil3q')
    expect(User.authenticate('ppilecki@icloud.com', 'cantremember')).to be_nil
  end
end
end
