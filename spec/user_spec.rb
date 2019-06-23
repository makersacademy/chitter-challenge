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
  end
end