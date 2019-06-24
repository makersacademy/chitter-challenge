require 'user'

describe User do
  describe '.register' do
    it 'creates a new user' do
      new_user = User.register('Remy', 'testEmail@gmail.com', 'Remzilla', 'password1')
      expect(new_user).to be_a(User)
      expect(new_user.name).to eq('Remy')
      expect(new_user.email).to eq('testEmail@gmail.com')
      expect(new_user.username).to eq('Remzilla')
    end

    it 'hashes a provided password' do
      expect(BCrypt::Password).to receive(:create).with('password1')
      User.register('Remy', 'testEmail@gmail.com', 'Remzilla', 'password1')
    end
  end
  
  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.register('Remy', 'testEmail@gmail.com', 'Remzilla', 'password1')
      authenticated_user = User.authenticate('Remzilla', 'password1')
  
      expect(authenticated_user.username).to eq user.username
    end
  end
end