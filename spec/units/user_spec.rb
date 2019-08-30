require 'user'

describe User do
  it 'can create a new user' do
    user = User.create('me@example.com', 'password1234')
    expect(user).to be_a(User)
    expect(user.id).to eq ('1')
    expect(user.email).to eq('me@example.com')
  end
  context 'authentication' do
    it 'can authenticate a user' do
      User.create('me@example.com', 'password1234')
      user = User.authenticate('me@example.com', 'password1234')
      expect(user).to be_a(User)
      expect(user.id).to eq ('1')
      expect(user.email).to eq('me@example.com')
    end
    it 'returns nil if user not found' do
      user = User.authenticate('nobody@example.com', 'password1234')
      expect(user).to be_nil
    end
    it 'returns nil if password incorrect' do
      User.create('me@example.com', 'password1234')
      user = User.authenticate('me@example.com', 'secretpassword')
      expect(user).to be_nil
    end
  end
end
